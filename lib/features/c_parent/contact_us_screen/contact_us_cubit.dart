import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../core/components/alerts/show_alert_dialog.dart';
import '../../../core/components/alerts/show_toast.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/model/failure_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/home_repo.dart';
import '../../intro/auth/models/user_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(const ContactUsState()) {
    // userModel = homeRepository.userModel;
    // userNameController.text = userModel.parentsName;
    // phoneController.text = userModel.parentsPhone;
    // emailController.text = userModel.parentsEmail;
    // messageController.clear();
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  UserModel userModel = UserModel();

  void onSubmit({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (userNameController.text.isEmpty) {
      validateMessage.add(l10n.nameError);
    }
    if (phoneController.text.isEmpty) {
      validateMessage.add(l10n.phoneError);
    }
    if (messageController.text.isEmpty) {
      validateMessage.add(l10n.messageError);
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
      Either<FailureModel, dynamic> response = await homeRepository.postContact(
        name: userNameController.text,
        phone: phoneController.text,
        email: emailController.text,
        message: messageController.text,
      );
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
            showToast(body: right['message'].toString());
            messageController.clear();
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
