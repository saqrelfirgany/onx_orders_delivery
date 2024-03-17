import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../core/components/alerts/show_alert_dialog.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../../../core/model/failure_model.dart';
import '../../../repositories/home_repo.dart';
import '../models/home_model.dart';

part 'new_invoice_state.dart';

class RechargeCubit extends Cubit<RechargeState> {
  RechargeCubit() : super(const RechargeState()) {
    // log('HomeCubit');
    init();
  }

  Future<void> init() async {
    log('HomeCubit init');
    await getHomeData();
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

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
          if (right['status'] == 200) {
            homeModel = HomeModel.fromJson(right['data']);
          } else {
            // FailureModel failureModel = FailureModel.fromJson(right);
            // showAlertDialog(
            //   textList: failureModel.errors,
            //   press: () => SmartDialog.dismiss(),
            // );
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

  void recharge({required String childsId}) async {
    final newState = state.copyWith(submissionStatus: SubmissionStatus.inProgress);

    emit(newState);
    try {
      Either<FailureModel, dynamic> response = await homeRepository.recharge(childsId: childsId);
      response.fold(
        (left) {
          showAlertDialog(
            textList: left.errors,
            press: () => SmartDialog.dismiss(),
          );
          final newState = state.copyWith(
            submissionStatus: SubmissionStatus.genericError,
          );
          emit(newState);
        },
        (right) async {
          if (right['status'] == 200) {
            showAlertDialog(
              text: right['message'].toString(),
              press: () => SmartDialog.dismiss(),
            );
            await getHomeData(update: false);
          } else {
            FailureModel failureModel = FailureModel.fromJson(right);
            showAlertDialog(
              height: 200,
              textList: failureModel.errors,
              press: () => SmartDialog.dismiss(),
            );
          }
          final newState = state.copyWith(
            submissionStatus: SubmissionStatus.success,
          );
          emit(newState);
        },
      );
      final newState = state.copyWith(submissionStatus: SubmissionStatus.success);
      emit(newState);
    } catch (error) {
      final newState = state.copyWith(submissionStatus: SubmissionStatus.invalidCredentialsError);
      emit(newState);
    }
  }
}
