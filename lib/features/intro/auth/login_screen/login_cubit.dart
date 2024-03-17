import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/alerts/show_alert_dialog.dart';
import '../../../../core/dependencies/dependencies.dart';
import '../../../../core/helper/helper.dart';
import '../../../../core/model/failure_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../repositories/auth_repo.dart';
import '../../../../route/app_route_names.dart';
import '../models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState()) {
    userIDController.clear();
    passwordController.clear();
  }

  final AuthRepository authRepository = serviceLocator<AuthRepository>();

  UserModel userModel = UserModel();

  TextEditingController userIDController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void onSubmit({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (userIDController.text.isEmpty) {
      validateMessage.add(l10n.userIDRequired);
    }
    if (passwordController.text.isEmpty) {
      validateMessage.add(l10n.passwordError);
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
      Either<FailureModel, dynamic> response = await authRepository.login(
        userID: userIDController.text,
        password: passwordController.text,
      );
      response.fold(
        (failureModel) {
          showAlertDialog(
            text: failureModel.result?.errMsg ?? '',
            press: () => SmartDialog.dismiss(),
          );
          final newState = state.copyWith(
            submissionStatus: SubmissionStatus.genericError,
          );
          emit(newState);
        },
        (right) async {
          if (right['Data'].isNotEmpty) {
            Helper.isLoggedIn = true;
            Helper.saveUserLogged(true);
            userModel = UserModel.fromJson(right);
            context.push(AppRouteName.homeScreenRoute);
            userIDController.clear();
            passwordController.clear();
            authRepository.setUserModel(model: userModel);
          } else {
            FailureModel failureModel = FailureModel.fromJson(right);
            showAlertDialog(
              height: 200,
              text: failureModel.result?.errMsg ?? '',
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
}
