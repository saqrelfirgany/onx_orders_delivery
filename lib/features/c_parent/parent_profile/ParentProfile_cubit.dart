import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../../../core/model/failure_model.dart';
import '../../../repositories/home_repo.dart';
import '../../intro/auth/models/user_model.dart';

part 'ParentProfile_state.dart';

class ParentProfileCubit extends Cubit<ParentProfileState> {
  ParentProfileCubit() : super(const ParentProfileState()) {
    // log('HomeCubit');
    // init();
  }

  Future<void> init() async {
    log('ParentProfileCubit init');
    // await myChilds();
    await parentData();
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

  // List<ChildModel> childModelList = [];
  UserModel parentModel = UserModel();

  // Future<void> myChilds() async {
  //   final newState0 = state.copyWithLoadingProjects(loadingProjects: true);
  //   emit(newState0);
  //   try {
  //     Either<FailureModel, dynamic> response = await homeRepository.myChilds();
  //
  //     response.fold(
  //       (left) {},
  //       (right) async {
  //         if (right['status'] == 200) {
  //           childModelList.clear();
  //           List<dynamic> dynamicList = right['data']['childs'];
  //           for (var element in dynamicList) {
  //             childModelList.add(ChildModel.fromJson(element));
  //           }
  //         }
  //       },
  //     );
  //   } catch (error) {
  //     log('error ${error}');
  //   } finally {
  //     final newState = state.copyWithLoadingProjects(loadingProjects: false);
  //     emit(newState);
  //   }
  // }

  Future<void> parentData() async {
    final newState0 = state.copyWithLoadingProjects(loadingProjects: true);
    emit(newState0);
    try {
      Either<FailureModel, dynamic> response = await homeRepository.parentData();

      response.fold(
        (left) {},
        (right) async {
          if (right['status'] == 200) {
            parentModel = UserModel.fromJson(right['data']['parent']);
            homeRepository.setUser(user: parentModel);
          }
        },
      );
    } catch (error) {
      log('error ${error}');
    } finally {
      final newState = state.copyWithLoadingProjects(loadingProjects: false);
      emit(newState);
    }
  }
}
