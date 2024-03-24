import 'dart:convert';

import 'package:either_dart/either.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';

class HomeRepository {
  /// Get Home
  Future<Either<FailureModel, dynamic>> getHomeData() async {
    var data = json.encode(
      {
        "Value": {
          "P_DLVRY_NO": "1010",
          "P_LANG_NO": "1",
          "P_BILL_SRL": "",
          "P_PRCSSD_FLG": "",
        }
      },
    );

    final response = await DioHelper.post(
      url: AppConstants.homeEndPoint,
      data: data,
    );
    return response.fold((e) {
      return Left(
        FailureModel(
          result: e.result,
        ),
      );
    }, (response) {
      return Right(response);
    });
  }
}
