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
      'Content-Type': 'application/json'
      // "User-Agent": Platform.operatingSystem,
      // "lang": '$lang',
      // if (Helper.token.isNotEmpty) "Authorization": 'Bearer ${Helper.token}',
    };

    /// Set dio
    dio = Dio(
      BaseOptions(
        baseUrl: url.isEmpty ? AppConstants.baseUrl : url,
        followRedirects: true,
        receiveDataWhenStatusError: true,
        // contentType: Headers.jsonContentType,
        // responseType: ResponseType.json,
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
        return Left(
          FailureModel(
            result: Result.fromJson(dynamicResponse),
          ),
        );
      } else {
        return Left(
          FailureModel(
            // result: e.result,
            result: Result.fromJson(dynamicResponse),
          ),
        );
      }
    } on DioError catch (e) {
      return Left(
        FailureModel(
          // result: e.result,
          result: Result(errMsg: 'Please check your internet connection'),
        ),
      );
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
        return Left(
          FailureModel(
            result: Result.fromJson(dynamicResponse),
          ),
        );
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                result: Result.fromJson(dynamicResponse),
              ),
            );
          }
          return Left(
            FailureModel(
              result: Result.fromJson(dynamicResponse),
            ),
          );
        } else {
          return Left(
            FailureModel(
              result: Result.fromJson(dynamicResponse),
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(
          FailureModel(
            // result: e.result,
            result: Result(errMsg: 'Please check your internet connection'),
          ),
        );
      }
      return Left(
        FailureModel(
          // result: e.result,
          result: Result(errMsg: 'Please check your internet connection'),
        ),
      );
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
        return Left(
          FailureModel(
            result: Result.fromJson(dynamicResponse),
          ),
        );
      } else {
        if (dynamicResponse['errors'] != null) {
          if (dynamicResponse['errors'].isNotEmpty) {
            return Left(
              FailureModel(
                result: Result.fromJson(dynamicResponse),
              ),
            );
          }
          return Left(
            FailureModel(
              result: Result.fromJson(dynamicResponse),
            ),
          );
        } else {
          return Left(
            FailureModel(
              result: Result.fromJson(dynamicResponse),
            ),
          );
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return Left(
          FailureModel(
            // result: e.result,
            result: Result(errMsg: 'Please check your internet connection'),
          ),
        );
      }
      return Left(
        FailureModel(
          // result: e.result,
          result: Result(errMsg: 'Please check your internet connection'),
        ),
      );
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
        return Left(
          FailureModel(
            result: Result.fromJson(dynamicResponse),
          ),
        );
      } else {
        return Left(
          FailureModel(
            result: Result.fromJson(dynamicResponse),
          ),
        );
      }
    } on DioError catch (e) {
      return Left(
        FailureModel(
          // result: e.result,
          result: Result(errMsg: 'Please check your internet connection'),
        ),
      );
    }
  }
}
