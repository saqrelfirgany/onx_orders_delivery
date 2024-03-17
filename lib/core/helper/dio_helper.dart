import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main.dart';
import '../../route/app_route_names.dart';
import '../components/alerts/show_alert_dialog.dart';
import '../model/failure_model.dart';
import 'constants.dart';
import 'helper.dart';

class DioHelper {
  static Dio? dio;

  /// Initialize dio
  static Future init({String url = '', String lang = 'en'}) async {
    /// Get user language code from storage
    // String userLocale = getx.Get.find<LangController>().selectedLang;
    // LocalStorage localStorage = LocalStorage();
    /// Get user auth token
    // userAuthenticationToken = await Helper.getUserTokenInSharedPreferences();
    // AppConstants.language = await localStorage.getLang;
    /// Set headers
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      // "User-Agent": Platform.operatingSystem,
      "lang": '$lang',
      if (Helper.token.isNotEmpty) "Authorization": 'Bearer ${Helper.token}',
      // if (Helper.token.isNotEmpty)
      //   "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9'
      //       '.eyJhdWQiOiI5IiwianRpIjoiYjEyN2NlOWZiNzdmOTc1ODZiNGI2NWI2OGM2ODM5NjYxMjA0ZGMy'
      //       'MjIzNDAzNWJlOTg5ZjRmYmY1NDE4MmY1YTMyMDY4NjRiMTAxM2Y0NmIiLCJpYXQiOjE3MDE0NjA4M'
      //       'TkuODc4NDQyMDQ5MDI2NDg5MjU3ODEyNSwibmJmIjoxNzAxNDYwODE5Ljg3ODQ0Mzk1NjM3NTEyMj'
      //       'A3MDMxMjUsImV4cCI6MTczMzA4MzIxOS44NzU5MjE5NjQ2NDUzODU3NDIxODc1LCJzdWIiOiIxIiw'
      //       'ic2NvcGVzIjpbXX0.QOcZwG0x5fHv_X9w2s_WQCJmwwhsKc_Le1QkrrztxUZhAJL_fN1GVYQPJuG'
      //       'EvHihybLZANCrLg6GVwwf8IUxbBeQ8wEE95B8EQK7l_5H66RE0XdQRrgG2JqvQUu_ru9Xwra3zsO'
      //       'GCOBpJiPnMLuVyOsd4EBHog_SE28cLEVpTj7HvyNij65au58BdiyIBeN5d2wLwTDHbqT34hZ45hThF'
      //       'N_fkgV4hZBoHrt2y3uuMWAb3mlDrp5eNzEdil9sDDhhVd1ys6EkewHH6e9_GJ8kUab8MnvbAYTTZVZ'
      //       'a-btCOanMpxr6fvHLVgqSboq6BRid_QVGQmxBiSj1udM4dRGp6bLzg7Vv42jPOBawhx55ZQB1SNe_u'
      //       'EleZw_RL0mm8Db-C-1_cC7sBv9dNvDQxyUEsNvo155Yh9QIT6eNm-t6Az2cCTOUpbaG9a28om-SP2RX'
      //       'Vs9Ehv2otm3algkL4yDmO8FbP2vdtoDF57bLh5NaiftcJjrR2ZJVqTBaWEEN6Y89P6OkFGzKTrf4dF2'
      //       'B_vfvQhNG4gYx4vIlQhWXwi4013QAPUrVSuZigshgvv1alSDE8Jx1VC19RX4ZbcsseMvFg05LLeCEtJ'
      //       'R46J-SkHRyFhhWKW6EeD-9AgedBOek4Isk8F4yZtQG6tJklE67vxE84r_H5lVDi96HjWItztsxpuQ',
    };

    /// Set dio
    dio = Dio(
      BaseOptions(
        baseUrl: url.isEmpty ? AppConstants.baseUrl : url,
        followRedirects: true,
        receiveDataWhenStatusError: true,
        // contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: headers,
        connectTimeout: const Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: const Duration(seconds: 60),
        // 60 seconds
        validateStatus: (status) {
          return status! < 800;
        },
      ),
    );
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  ///
  /// GET
  ///
  static Future<Either<FailureModel, dynamic>> get({
    required String url,
    Map<String, dynamic>? parameters,
    int? page = 1,
    int? limit,
    bool logoutUserFlag = true,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio!.get(
        url,
        queryParameters: parameters,
        options: Options(headers: headers),
      );
      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        return Left(FailureModel(message: dynamicResponse['message']));
      }
    } on DioError catch (e) {
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  static void logOutUser({required String message}) {
    showAlertDialog(
      canClose: false,
      height: 160,
      text: message,
      press: () {
        Helper.token = '';
        Helper.isLoggedIn = false;
        Helper.saveUserLogged(false);
        Helper.saveUserToken('');
        navigatorKey.currentContext!.go(AppRouteName.loginScreenRoute);
      },
    );
  }

  /// POST
  static Future<Either<FailureModel, dynamic>> post({url, parameters, data}) async {
    try {
      final response = await dio!.post(
        url,
        queryParameters: parameters,
        data: data,
      );

      dynamic dynamicResponse = await jsonDecode(response.toString());

      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                message: dynamicResponse['errors'][0],
                errors: dynamicResponse['errors'],
              ),
            );
          }
          return Left(
            FailureModel(
              message: dynamicResponse['message'],
              statusCode: response.statusCode!,
              errors: dynamicResponse['errors'],
            ),
          );
        } else {
          return Left(
            FailureModel(
              message: 'somethingWentWrong',
              errors: dynamicResponse['errors'],
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(FailureModel(message: 'Please check your internet connection'));
      }
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  /// POST
  static Future<Either<FailureModel, dynamic>> delete({url, parameters, data}) async {
    try {
      final response = await dio!.delete(
        url,
        queryParameters: parameters,
        data: data,
      );
      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['messageasd']));
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                message: dynamicResponse['message'],
                errors: dynamicResponse['errors'],
              ),
            );
          }
          return Left(
            FailureModel(
              message: dynamicResponse['message'],
              statusCode: response.statusCode!,
              errors: dynamicResponse['errors'],
            ),
          );
        } else {
          return Left(
            FailureModel(
              message: 'somethingWentWrong',
              errors: dynamicResponse['errors'],
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(FailureModel(message: 'Please check your internet connection'));
      }
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }

  /// PUT
  static Future<Either<FailureModel, dynamic>> put({url, parameters, data}) async {
    try {
      final response = await dio!.put(
        url,
        queryParameters: parameters,
        data: data,
      );

      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        if (response.data['status'] == 401) {
          logOutUser(message: dynamicResponse['message']);
        }
        return Right(dynamicResponse);
      } else if (response.statusCode == 401) {
        logOutUser(message: dynamicResponse['message']);
        return Left(FailureModel(message: dynamicResponse['message']));
      } else {
        return Left(FailureModel(message: dynamicResponse['message']));
      }
    } on DioError catch (e) {
      return Left(FailureModel(message: 'Please check your internet connection'));
    }
  }
}
