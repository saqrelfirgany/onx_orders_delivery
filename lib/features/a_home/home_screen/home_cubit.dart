import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../../../core/model/failure_model.dart';
import '../../../repositories/auth_repo.dart';
import '../../../repositories/home_repo.dart';
import '../models/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    // log('HomeCubit');
    init();
  }

  Future<void> init() async {
    log('HomeCubit init');
    await getHomeData();
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();
  final AuthRepository authRepository = serviceLocator<AuthRepository>();

  HomeModel homeModel = HomeModel();

  Future<void> getHomeData({bool update = true}) async {
    if (update) {
      final newState0 = state.copyWithLoadingProjects(loadingProjects: true);
      emit(newState0);
    }
    try {
      Either<FailureModel, dynamic> response = await homeRepository.getHomeData();

      response.fold(
        (left) {
          // showAlertDialog(
          //   textList: left.errors,
          //   press: () => SmartDialog.dismiss(),
          // );
        },
        (right) async {
          homeModel = HomeModel.fromJson(right);
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
