import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/controllers/language_cubit.dart';
import '../../../../core/enum/submission_status.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../Settings_cubit.dart';
import 'ImagePickerUpdateProfile.dart';

Future<dynamic> updateProfileBottomSheet({
  required BuildContext context,
  required SettingsCubit cubit,
}) {
  final l10n = AppLocalizations.of(context);
  final languageCubit = context.read<LanguageCubit>();

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 0,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return BlocProvider<SettingsCubit>.value(
        value: cubit,
        child: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: updateProfileBottomSheetContent(cubit: cubit),
            );
          },
        ),
      );
    },
  );
}

class updateProfileBottomSheetContent extends StatelessWidget {
  const updateProfileBottomSheetContent({super.key, required this.cubit});

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return StatefulBuilder(builder: (context, setState) {
      return BlocProvider<SettingsCubit>.value(
        value: cubit,
        child: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              // height: 400,
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.v),
                    Text(
                      l10n.updateProfile,
                      style: CustomTextStyles.titleLargeBluegray70001SemiBold,
                    ),
                    SizedBox(height: 8.v),
                    ImagePickerUpdateProfile(cubit: cubit),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.parentsNameController,
                      hintText: l10n.name,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.parentsEmailController,
                      hintText: l10n.email,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    GestureDetector(
                      onTap: () => cubit.selectDate(context: context),
                      child: CustomTextFormField(
                        controller: cubit.parentsBirthdateController,
                        hintText: l10n.birthDate,
                        enabled: false,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 16.v,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 2.v,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        border: Border.all(
                          color: appTheme.gray200,
                          width: 1,
                        ),
                      ),
                      child: GenderSelection(cubit: cubit),
                    ),
                    SizedBox(height: 16.v),
                    state.submissionStatus == SubmissionStatus.inProgress
                        ? MainLoading()
                        : CustomElevatedButton(
                            onPressed: () => cubit.parentUpdate(context: context),
                            text: l10n.update,
                          ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.cubit});

  final SettingsCubit cubit;

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = '';

  @override
  void initState() {
    selectedGender = widget.cubit.parentModel.parentsGender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return Row(
      children: [
        Text(
          l10n.gender,
          style: theme.textTheme.titleMedium,
        ),
        Spacer(),
        Row(
          children: <Widget>[
            Radio(
              value: 'male',
              groupValue: selectedGender,
              activeColor: theme.colorScheme.primary,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedGender = value;
                    widget.cubit.selectedGender = value;
                  }
                });
              },
            ),
            Text(l10n.male),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 'female',
              groupValue: selectedGender,
              activeColor: theme.colorScheme.primary,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedGender = value;
                    widget.cubit.selectedGender = value;
                  }
                });
              },
            ),
            Text(l10n.female),
          ],
        ),
      ],
    );
  }
}
