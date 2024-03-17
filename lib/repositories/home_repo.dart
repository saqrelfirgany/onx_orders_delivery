import 'package:either_dart/either.dart';

import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';

class HomeRepository {
  /// Get Home
  Future<Either<FailureModel, dynamic>> getHomeData() async {
    final response = await DioHelper.get(
      url: 'AppConstants.homeEndPoint',
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
