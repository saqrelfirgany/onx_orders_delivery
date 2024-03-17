import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/components/alerts/show_alert_dialog.dart';
import '../../../core/components/alerts/show_toast.dart';
import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../../../core/helper/helper.dart';
import '../../../core/model/failure_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../repositories/auth_repo.dart';
import '../../../repositories/home_repo.dart';
import '../../../repositories/initial_repo.dart';
import '../../../route/app_route_names.dart';
import '../../a_home/models/contacts_model.dart';
import '../../a_home/models/info.dart';
import '../../intro/auth/models/user_model.dart';

part 'Settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    // log('HomeCubit');
    // init();
  }

  Future<void> init() async {
    log('SettingsCubit init');
    // await parentData();
    // parentModel = homeRepository.userModel;
    // parentsNameController.text = parentModel.parentsName;
    // parentsEmailController.text = parentModel.parentsEmail;
    // parentsBirthdateController.text = parentModel.parentsBirthdate;
    // selectedGender = '';
    // contactsModel = initialRepository.contactsModel;
  }

  final HomeRepository homeRepository = serviceLocator<HomeRepository>();
  final InitialRepository initialRepository = serviceLocator<InitialRepository>();
  final AuthRepository authRepository = serviceLocator<AuthRepository>();
  ContactsModel contactsModel = ContactsModel();

  // List<ChildModel> childModelList = [];
  UserModel parentModel = UserModel();
  File? profileImageFile;

  TextEditingController parentsNameController = TextEditingController();
  TextEditingController parentsEmailController = TextEditingController();
  TextEditingController parentsBirthdateController = TextEditingController();

  String selectedGender = '';

  void openLink({required String url}) async {
    log('url:::$url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showAlertDialog(
        text: 'Could not launch $url',
        press: () => SmartDialog.dismiss(),
      );
    }
  }

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

  void parentUpdate({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    List<String> validateMessage = [];
    if (parentsNameController.text.isEmpty) {
      validateMessage.add(l10n.nameError);
    }
    if (parentsEmailController.text.isEmpty) {
      validateMessage.add(l10n.emailError);
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
      Either<FailureModel, dynamic> response = await authRepository.parentUpdate(
        name: parentsNameController.text,
        email: parentsEmailController.text,
        phone: parentModel.parentsPhone,
        gender: selectedGender,
        birthdate: parentsBirthdateController.text,
        image: profileImageFile,
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
            showToast(body: right['message']);
            Navigator.pop(context);
            parentModel = UserModel.fromJson(right['data']['parent']);
            homeRepository.setUser(user: parentModel);
          }
        },
      );
    } catch (error) {
    } finally {
      final newState = state.copyWith(
        submissionStatus: SubmissionStatus.success,
      );
      emit(newState);
    }
  }

  Future<void> selectDate({required BuildContext context}) async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    final newState = state.copyWithPickDate(loading: true);
    emit(newState);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    // If the user confirms the dialog, update the state with the new date
    if (pickedDate != null) {
      // Create a DateFormat object with the year-month-day pattern
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      // Format the picked date into a string
      String formattedDate = dateFormat.format(pickedDate);

      parentsBirthdateController.text = formattedDate;
      final doneState = state.copyWithPickDate(loading: false);
      emit(doneState);
    }
  }

  void setSelectedInfo({required String key}) {
    InfoModel info = InfoModel();
    initialRepository.infoModelList.forEach((element) {
      if (element.infosKey == key) {
        info = element;
      }
    });
    initialRepository.setSelectedInfo(info: info);
  }

  void logout({required BuildContext context}) async {
    final l10n = AppLocalizations.of(context);

    context.go(AppRouteName.loginScreenRoute);
    removeUser(context);
    // try {
    //   Either<FailureModel, dynamic> response = await authRepository.logout();
    //   response.fold(
    //     (left) {
    //       removeUser(context);
    //     },
    //     (right) async {
    //       if (right['status'] == 200) {
    //         removeUser(context);
    //       } else {
    //         removeUser(context);
    //       }
    //     },
    //   );
    // } catch (error) {
    //   removeUser(context);
    // }
  }

  void removeUser(BuildContext context) {
    Helper.token = '';
    Helper.isLoggedIn = false;
    Helper.saveUserLogged(false);
    Helper.saveUserToken('');
  }
}
