import 'dart:developer';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/features/c_parent/phone_number_screen/phone_number_cubit.dart';

import '../../../core/components/app_bar/back_app_bar.dart';
import '../../../core/components/loading/main_loaing.dart';
import '../../../core/controllers/language_cubit.dart';
import '../../../core/enum/submission_status.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../l10n/app_localizations.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('965');

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return BlocProvider<PhoneNumberCubit>(
      create: (context) => PhoneNumberCubit(),
      child: BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<PhoneNumberCubit>();
          log('PhoneNumberCubit state ${state.submissionStatus}');

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: BackAppBar(title: l10n.changeNumber),
            body: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 36.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.oldNumber,
                      style: CustomTextStyles.bodyLargeBlack900_1,
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "+966 ${cubit.parentModel.parentsPhone}",
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 32.v),
                    Text(
                      l10n.newNumber,
                      style: CustomTextStyles.bodyLargeBlack900_1,
                    ),
                    SizedBox(height: 7.v),
                    Row(
                      children: [
                        CustomTextFormField(
                          controller: TextEditingController(),
                          width: 60.h,
                          enabled: false,
                          hintText: "+966",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 16.v,
                          ),
                        ),
                        SizedBox(width: 8.h),
                        Expanded(
                          child: CustomTextFormField(
                            controller: cubit.phoneNumberController,
                            hintText: l10n.phoneNumber,
                            textInputType: TextInputType.phone,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 16.v,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48.v),
                    state.submissionStatus == SubmissionStatus.inProgress
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MainLoading(),
                            ],
                          )
                        : CustomElevatedButton(
                            onPressed: () => cubit.parentUpdate(context: context),
                            text: l10n.next,
                          ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
