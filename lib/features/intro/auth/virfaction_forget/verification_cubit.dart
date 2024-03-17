import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/alerts/show_alert_dialog.dart';
import '../../../../core/components/alerts/show_toast.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/enum/submission_status.dart';
import '../../../../core/model/failure_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/auth_repo.dart';
import '../../../../repositories/home_repo.dart';
import '../../../../route/app_route_names.dart';
import '../models/user_model.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(const VerificationState()) {
    phoneNumberController.text = authRepository.forgetPhoneNumber;
    parentModel = homeRepository.userModel;
  }

  final AuthRepository authRepository = serviceLocator<AuthRepository>();
  final HomeRepository homeRepository = serviceLocator<HomeRepository>();
  UserModel parentModel = UserModel();

  UserModel userModel = UserModel();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController oTPController = TextEditingController();

  void onSubmit({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (oTPController.text.isEmpty) {
      validateMessage.add(l10n.verificationCodeError);
    }
    if (validateMessage.isNotEmpty) {
      showAlertDialog(
        textList: validateMessage,
        press: () => SmartDialog.dismiss(),
      );
      return;
    }
    final newState = state.copyWith(
      submissionStatus: SubmissionStatus.inProgress,
    );

    emit(newState);
    try {
      Either<FailureModel, dynamic> response = await authRepository.checkVerifyCode(
        phone: phoneNumberController.text,
        otp: oTPController.text,
      );

      response.fold(
        (left) {
          showAlertDialog(
            textList: left.message,
            press: () => SmartDialog.dismiss(),
          );
          final newState = state.copyWith(
            submissionStatus: SubmissionStatus.genericError,
          );
          emit(newState);
        },
        (right) async {
          if (right['status'] == 200) {
            log('authRepository.changePhoneNumberFlag:::${authRepository.changePhoneNumberFlag}');

            ///
            if (authRepository.changePhoneNumberFlag == true) {
              await parentUpdate();
              showToast(body: 'body');
              context.pop();
              context.pop();
              context.pop();
              context.pushReplacement(AppRouteName.settingsScreenRoute);
            } else {
              context.push(AppRouteName.resetPassScreenRoute);
            }
          } else {
            FailureModel failureModel = FailureModel.fromJson(right);
            showAlertDialog(
              height: 200,
              textList: [failureModel.message],
              press: () => SmartDialog.dismiss(),
            );
          }
          final newState = state.copyWith(
            submissionStatus: SubmissionStatus.success,
          );
          emit(newState);
        },
      );
      final newState = state.copyWith(
        submissionStatus: SubmissionStatus.success,
      );
      emit(newState);
    } catch (error) {
      final newState = state.copyWith(
        submissionStatus: SubmissionStatus.invalidCredentialsError,
      );
      emit(newState);
    }
  }

  Future<void> parentUpdate() async {
    try {
      Either<FailureModel, dynamic> response = await authRepository.parentUpdate(
        name: parentModel.parentsName,
        email: parentModel.parentsEmail,
        phone: phoneNumberController.text,
        gender: parentModel.parentsGender,
        birthdate: parentModel.parentsBirthdate,
      );
      response.fold(
        (left) {},
        (right) async {
          if (right['status'] == 200) {
            showToast(body: right['message']);
            parentModel = UserModel.fromJson(right['data']['parent']);
            homeRepository.setUser(user: parentModel);
          }
        },
      );
    } catch (error) {
      log('message');
    }
  }

  Future<void> sendOTP({required BuildContext context}) async {
    oTPController.clear();
    Either<FailureModel, dynamic> response = await authRepository.sendVerifyCode(
      phone: phoneNumberController.text,
    );
    response.fold(
      (left) {
        showAlertDialog(
          textList: left.message,
          press: () => SmartDialog.dismiss(),
        );
      },
      (right) async {
        log("right['status']::::::${right['status']}");
        if (right['status'] == 200) {
          showToast(
            body: right['data'].toString(),
            toastLength: Toast.LENGTH_LONG,
          );
          authRepository.setOTP(otp: right['data'].toString());
          final nullState = state.copyWith(submissionStatus: SubmissionStatus.idle);
          emit(nullState);
          final newState = state.copyWith(submissionStatus: SubmissionStatus.success);
          emit(newState);
        } else {
          FailureModel failureModel = FailureModel.fromJson(right);
          showAlertDialog(
            height: 200,
            textList: [failureModel.message],
            press: () => SmartDialog.dismiss(),
          );
        }
      },
    );
  }
}
