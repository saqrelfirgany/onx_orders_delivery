import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/alerts/show_alert_dialog.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/model/failure_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/auth_repo.dart';
import '../../../../route/app_route_names.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit() : super(const ResetState()) {
    phoneController.text = authRepository.forgetPhoneNumber;
    passController.clear();
    confPassController.clear();
  }

  final AuthRepository authRepository = serviceLocator<AuthRepository>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  TextEditingController confPassController = TextEditingController();

  void onSubmit({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (passController.text.isEmpty) {
      validateMessage.add(l10n.passwordError);
    }
    if (confPassController.text.isEmpty) {
      validateMessage.add(l10n.conPasswordError);
    }
    if (confPassController.text != passController.text) {
      validateMessage.add(l10n.matchPasswordError);
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
      Either<FailureModel, dynamic> response = await authRepository.forgotPasswordMobile(
        phone: phoneController.text,
        password: passController.text,
      );
      response.fold(
        (left) {
          showAlertDialog(
            textList: left.errors,
            press: () => SmartDialog.dismiss(),
          );
        },
        (right) async {
          if (right['status'] == 200) {
            ;
            showAlertDialog(
              press: () => context.push(AppRouteName.loginScreenRoute),
              text: right['message'],
              canClose: false,
            );
            passController.clear();
            confPassController.clear();
          } else {
            FailureModel failureModel = FailureModel.fromJson(right);
            showAlertDialog(
              height: 200,
              textList: failureModel.errors,
              press: () => SmartDialog.dismiss(),
            );
          }
        },
      );
    } catch (error) {
      final newState = state.copyWith(
        submissionStatus: SubmissionStatus.invalidCredentialsError,
      );
      emit(newState);
    } finally {
      final newState = state.copyWith(
        submissionStatus: SubmissionStatus.success,
      );
      emit(newState);
    }
  }
}
