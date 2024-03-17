import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:saqrelfirgany/core/helper/helper.dart';
import 'package:saqrelfirgany/features/intro/auth/models/request_login_model.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';
import '../features/intro/auth/models/user_model.dart';

class AuthRepository {
  String forgetPhoneNumber = '';
  String otpNumber = '';
  bool changePhoneNumberFlag = false;
  UserModel userModel = UserModel();

  /// login
  Future<Either<FailureModel, dynamic>> login({
    required String userID,
    required String password,
  }) async {
    RequestLoginModel requestLoginModel = RequestLoginModel(
      value: Value(
        pLANGNO: Helper.lang == 'en' ? '1' : '2',
        pDLVRYNO: userID,
        pPSSWRD: password,
      ),
    );
    var data = requestLoginModel.toJson();

    var data2 = json.encode({
      "Value": {"P_LANG_NO": "1", "P_DLVRY_NO": "1010", "P_PSSWRD": "1"}
    });
    final response = await DioHelper.post(
      url: AppConstants.loginEndPoint,
      data: data,
    );

    return response.fold(
      (e) {
        return Left(
          FailureModel(
            result: e.result,
          ),
        );
      },
      (response) {
        return Right(response);
      },
    );
  }

  void setUserModel({required UserModel model}) {
    userModel = model;
  }
}
