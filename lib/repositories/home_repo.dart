import 'dart:developer';

import 'package:either_dart/either.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';
import '../features/a_home/models/home_model.dart';
import '../features/intro/auth/models/user_model.dart';

class HomeRepository {
  String childId = '';
  String childPurchasesDate = '';
  ChildsBalance childModel = ChildsBalance();
  // ChildModel childSettingsModel = ChildModel();

  UserModel userModel = UserModel();

  /// Get Home
  Future<Either<FailureModel, dynamic>> parentData() async {
    final response = await DioHelper.get(
      url: AppConstants.parentDataEndPoint,
    );
    return response.fold(
      (e) {
        return Left(
          FailureModel(
            message: e.message,
            statusCode: e.statusCode,
            errors: e.errors,
          ),
        );
      },
      (response) {
        return Right(response);
      },
    );
  }

  /// Get Home
  Future<Either<FailureModel, dynamic>> myChilds() async {
    final response = await DioHelper.get(
      url: AppConstants.myChildsEndPoint,
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

  /// Get Home
  Future<Either<FailureModel, dynamic>> getHomeData() async {
    final response = await DioHelper.get(
      url: AppConstants.homeEndPoint,
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

  /// Get Child
  Future<Either<FailureModel, dynamic>> getChildData({required String id}) async {
    final response = await DioHelper.get(
      url: '${AppConstants.childEndPoint}/$id',
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

  /// Get Child
  Future<Either<FailureModel, dynamic>> addTransportation({required String id}) async {
    final response = await DioHelper.post(
      url: AppConstants.addTransportationEndPoint,
      parameters: {
        'childs_digital_id': id,
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

  /// Get Child
  Future<Either<FailureModel, dynamic>> addAttendence({required String id}) async {
    final response = await DioHelper.post(
      url: AppConstants.addAttendenceEndPoint,
      parameters: {
        'childs_digital_id': id,
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

  /// Get Child Purchases
  Future<Either<FailureModel, dynamic>> getChildPurchases({
    required String id,
    required int month,
    required int year,
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.childPurchasesEndPoint,
      parameters: {
        'childs_id': id,
        'month': month,
        'year': year,
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

  /// Get Child Transportations
  Future<Either<FailureModel, dynamic>> getChildTransportations({
    required String id,
    required int month,
    required int year,
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.childTransportationsEndPoint,
      parameters: {
        'childs_id': id,
        'month': month,
        'year': year,
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

  /// Get Child Attendance
  Future<Either<FailureModel, dynamic>> getChildAttendance({
    required String id,
    required int month,
    required int year,
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.childAttendanceEndPoint,
      parameters: {
        'childs_id': id,
        'month': month,
        'year': year,
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

  /// Get Allergens
  Future<Either<FailureModel, dynamic>> getAllergens() async {
    final response = await DioHelper.get(
      url: AppConstants.getAllergensEndPoint,
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

  /// updateChildAllergens
  Future<Either<FailureModel, dynamic>> updateChildAllergens({
    required String childsId,
    required List<String> allergens,
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.updateChildAllergensEndPoint,
      parameters: {
        "childs_id": childsId,
        "allergens_ids[]": allergens,
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

  /// updateChildAllergens
  Future<Either<FailureModel, dynamic>> postContact({
    required String name,
    required String phone,
    required String email,
    required String message,
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.postContactEndPoint,
      parameters: {
        "contact_us_name": name,
        "contact_us_phone": phone,
        "contact_us_email": email,
        "contact_us_message": message,
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

  /// updateChildAllergens
  Future<Either<FailureModel, dynamic>> recharge({
    required String childsId,
    String balance = '400',
    String paymentsMethod = 'online',
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.rechargeEndPoint,
      parameters: {
        "childs_id": childsId,
        "transactions_amount": balance,
        "payments_method": paymentsMethod,
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

  /// updateChildAllergens
  Future<Either<FailureModel, dynamic>> addSpendingLimit({
    required String childsId,
    required String type,
    required String amount,
    String status = '1',
  }) async {
    final response = await DioHelper.post(
      url: AppConstants.addSpendingLimitEndPoint,
      parameters: {
        "childs_id": childsId,
        "spending_limits_type": type,
        "spending_limits_amount": amount,
        "spending_limits_status": status,
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

  /// Get Child
  Future<Either<FailureModel, dynamic>> getPurchasesDate({
    required String id,
    required String date,
  }) async {
    final response = await DioHelper.get(
      url: AppConstants.getPurchasesDateEndPoint,
      parameters: {
        'childs_id': id,
        'date': date,
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

  void setChildId({required String id}) {
    childId = id;
  }

  void setChild({required ChildsBalance child}) {
    childModel = child;
    log('child :${childModel.childsName}');
  }
  //
  // void setChildSettingsModel({required ChildModel child}) {
  //   childSettingsModel = child;
  // }

  void setChildPurchasesDate({required date}) {
    childPurchasesDate = date;
  }

  void setUser({required UserModel user}) {
    userModel = user;
  }
}
