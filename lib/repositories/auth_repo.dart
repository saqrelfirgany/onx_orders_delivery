import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/helper/helper.dart';
import '../core/model/failure_model.dart';
import '../features/intro/auth/models/user_model.dart';

class AuthRepository {
  String forgetPhoneNumber = '';
  String otpNumber = '';
  bool changePhoneNumberFlag = false;
  UserModel userModel = UserModel();

  /// login
  Future<Either<FailureModel, dynamic>> login({
    required String phone,
    String countryCode = '966',
    String deviceToken = '',
    required String password,
    String authType = 'phone',
  }) async {
    deviceToken = Helper.deviceToken;
    final response = await DioHelper.post(
      url: AppConstants.loginEndPoint,
      parameters: {
        'phone': phone,
        'parents_country_code': countryCode,
        'password': password,
        'device_token': deviceToken,
        'auth_type': authType,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// login
  Future<Either<FailureModel, dynamic>> parentUpdate({
    required String name,
    required String email,
    required String phone,
    String countryCode = '966',
    required String gender,
    required String birthdate,
    File? image,
  }) async {
    String fileName = '';
    if (image != null) {
      // Validate and convert the image if necessary
      if (isImageValid(image)) {
        fileName = image.path.split('/').last;
      } else {
        // Handle invalid image type here (e.g., show an error message)
        return Left(FailureModel(message: 'Invalid image type'));
      }
    }
    final FormData formData = FormData.fromMap(
      {
        'parents_name': name,
        'parents_email': email,
        'parents_phone': phone,
        'parents_country_code': countryCode,
        if (gender.isNotEmpty) 'parents_gender': gender,
        'parents_birthdate': birthdate,
        if (image != null)
          'parents_image': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
      },
    );
    final response = await DioHelper.post(
      url: AppConstants.parentUpdateEndPoint,
      data: formData,
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// checkPhone
  Future<Either<FailureModel, dynamic>> checkPhone({
    required String phone,
    String countryCode = '966',
    String authType = 'phone',
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.checkPhoneNumberEndPoint,
      parameters: {
        'phone': phone,
        'country_code': countryCode,
        'auth_type': authType,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// checkPhone
  Future<Either<FailureModel, dynamic>> checkVerifyCode({
    required String phone,
    required String otp,
    String countryCode = '966',
    String authType = 'phone',
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.checkVerifyCodeEndPoint,
      parameters: {
        'phone': phone,
        'verify_code': otp,
        'country_code': countryCode,
        'auth_type': authType,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// checkPhone
  Future<Either<FailureModel, dynamic>> forgotPasswordMobile({
    required String phone,
    required String password,
    String countryCode = '966',
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.forgotPasswordMobileEndPoint,
      parameters: {
        'phone': phone,
        'parents_country_code': countryCode,
        'password': password,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// checkPhone
  Future<Either<FailureModel, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.changePasswordEndPoint,
      parameters: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// checkPhone
  Future<Either<FailureModel, dynamic>> sendVerifyCode({
    required String phone,
    String countryCode = '966',
    String authType = 'phone',
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.sendVerifyCodeEndPoint,
      parameters: {
        'phone': phone,
        'country_code': countryCode,
        'auth_type': authType,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// register
  Future<Either<FailureModel, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    String countryCode = '+20',
    required String password,
    required String birthdate,
    required String gender,
    required String countriesId,
    String authType = 'email',
    required String company,
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.registerEndPoint,
      data: {
        'customers_name': name,
        'customers_email': email,
        'customers_phone': phone,
        'customers_country_code': countryCode,
        'password': password,
        'customers_birthdate': birthdate,
        'customers_gender': gender,
        'countries_id': countriesId,
        'device_token': Helper.deviceToken,
        'auth_type': authType,
        'customers_company': company,
      },
    );
    return response.fold((e) {
      return Left(FailureModel(
        message: e.message,
        statusCode: e.statusCode,
        errors: e.errors,
      ));
    }, (response) {
      return Right(response);
    });
  }

  /// logout
  Future<Either<FailureModel, dynamic>> logout() async {
    final response = await DioHelper.post(
      url: AppConstants.logoutEndPoint,
    );
    return response.fold((e) {
      return Left(
        FailureModel(
          message: e.message,
          statusCode: e.statusCode,
          errors: e.errors,
        ),
      );
    }, (response) {
      return Right(response);
    });
  }

  void setPhoneNumber({required String phone}) {
    forgetPhoneNumber = phone;
  }

  void setOTP({required String otp}) {
    otpNumber = otp;
  }

  // Function to validate image type
  bool isImageValid(File image) {
    // Check the file extension
    final allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
    final extension = image.path.split('.').last.toLowerCase();
    if (!allowedExtensions.contains(extension)) {
      return false;
    }

    // Optionally, you can check the MIME type if available
    // Note that MIME type detection may require additional packages
    // For example, using the `mime` package:
    // final mimeType = lookupMimeType(image.path);
    // if (mimeType != null && mimeType.startsWith('image/')) {
    //   return true;
    // }

    return true;
  }

  void setIsChangePhoneNumber({required bool flag}) {
    changePhoneNumberFlag = flag;
  }
}
