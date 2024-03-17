import 'dart:developer';

import 'package:either_dart/either.dart';

import '../core/helper/constants.dart';
import '../core/helper/dio_helper.dart';
import '../core/model/failure_model.dart';
import '../features/a_home/models/contacts_model.dart';
import '../features/a_home/models/info.dart';

class InitialRepository {
  List<InfoModel> infoModelList = [];
  InfoModel selectedInfo = InfoModel();
  ContactsModel contactsModel = ContactsModel();

  Future<void> getContactsData() async {
    try {
      Either<FailureModel, dynamic> response = await _getContacts();

      response.fold(
        (left) {},
        (right) async {
          if (right['status'] == 200) {
            contactsModel = ContactsModel.fromJson(right['data']['contacts']);
          } else {}
        },
      );
    } catch (error) {
      log('error ${error}');
    }
  }

  Future<void> getInfoData({bool update = true}) async {
    try {
      Either<FailureModel, dynamic> response = await _getInfo();
      response.fold(
        (left) {},
        (right) async {
          if (right['status'] == 200) {
            infoModelList.clear();
            List<dynamic> dynamicList = right['data']['infos'];
            for (var element in dynamicList) {
              infoModelList.add(InfoModel.fromJson(element));
            }
          }
        },
      );
    } catch (error) {
      log('error ${error}');
    }
  }

  /// Get
  Future<Either<FailureModel, dynamic>> _getInfo() async {
    final response = await DioHelper.get(
      url: AppConstants.infosEndPoint,
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

  /// Get
  Future<Either<FailureModel, dynamic>> _getContacts() async {
    final response = await DioHelper.get(
      url: AppConstants.contactsEndPoint,
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

  void setSelectedInfo({required InfoModel info}) {
    selectedInfo = info;
  }
}
