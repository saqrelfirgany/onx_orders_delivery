import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/components/app_bar/back_app_bar.dart';
import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/enum/submission_status.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';
import 'forget_cubit.dart';

class ForgetCheckExistScreen extends StatelessWidget {
  ForgetCheckExistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<ForgetCubit>(
      create: (context) => ForgetCubit(),
      child: BlocConsumer<ForgetCubit, ForgetState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ForgetCubit>();
          return Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            appBar: BackAppBar(title: l10n.forgetPassword),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                // key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 55.v),
                  child: Column(
                    children: [
                      Text(
                        l10n.enterYourPhoneNumber,
                        style: CustomTextStyles.titleMediumSemiBold18,
                      ),
                      SizedBox(height: 9.v),
                      Text(
                        l10n.weWillSendYouVerificationCode,
                        style: CustomTextStyles.bodyLargeBluegray700,
                      ),
                      SizedBox(height: 40.v),
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
                      SizedBox(height: 64.v),
                      state.submissionStatus == SubmissionStatus.inProgress
                          ? MainLoading()
                          : CustomElevatedButton(
                              text: l10n.next,
                              onPressed: () => cubit.onSubmit(context: context),
                            ),
                      SizedBox(height: 5.v)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
