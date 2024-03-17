import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dependencies/dependencies.dart';
import '../../../core/enum/submission_status.dart';
import '../../../repositories/initial_repo.dart';
import '../../a_home/models/contacts_model.dart';
import '../../a_home/models/info.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(const InfoState()) {
    init();
  }

  Future<void> init() async {
    log('InfoCubit init');
    infoModel = initialRepository.selectedInfo;
    contactsModel = initialRepository.contactsModel;
  }

  final InitialRepository initialRepository = serviceLocator<InitialRepository>();

  InfoModel infoModel = InfoModel();
  ContactsModel contactsModel = ContactsModel();
}
