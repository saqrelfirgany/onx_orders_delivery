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
import '../../../../route/app_route_names.dart';
import '../models/user_model.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(const ForgetState()) {
    phoneNumberController.clear();
  }

  final AuthRepository authRepository = serviceLocator<AuthRepository>();

  UserModel userModel = UserModel();

  TextEditingController phoneNumberController = TextEditingController();

  void onSubmit({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (phoneNumberController.text.isEmpty) {
      validateMessage.add(l10n.phoneOrEmailError);
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
      Either<FailureModel, dynamic> response = await authRepository.checkPhone(
        phone: phoneNumberController.text,
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
          log("right['status']::::::${right['status']}");
          if (right['status'] == 200) {
            /// Send OTP
            await sendOTP(context: context);
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

  Future<void> sendOTP({required BuildContext context}) async {
    authRepository.setPhoneNumber(phone: phoneNumberController.text);
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
          authRepository.setIsChangePhoneNumber(flag: false);
          authRepository.setOTP(otp: right['data'].toString());
          context.push(AppRouteName.vitrificationForgetScreenRoute);
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
