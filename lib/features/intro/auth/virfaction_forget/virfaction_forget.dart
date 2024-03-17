import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';
import 'package:saqrelfirgany/features/intro/auth/virfaction_forget/verification_cubit.dart';

import '../../../../core/components/app_bar/back_app_bar.dart';
import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/enum/submission_status.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_pin_code_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import 'body/ResendTimer.dart';

class VitrificationForgetScreen extends StatelessWidget {
  VitrificationForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<VerificationCubit>(
      create: (context) => VerificationCubit(),
      child: BlocConsumer<VerificationCubit, VerificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<VerificationCubit>();

          return Scaffold(
            extendBody: true,
            appBar: BackAppBar(title: l10n.verification),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 54.v),
                child: Column(
                  children: [
                    Text(l10n.enterVerification, style: CustomTextStyles.titleMediumSemiBold18),
                    SizedBox(height: 9.v),
                    Container(
                      width: 320.h,
                      child: Text(
                        "${l10n.sentVerification} ${cubit.authRepository.forgetPhoneNumber}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700.copyWith(height: 1.75),
                      ),
                    ),
                    Container(
                      width: 320.h,
                      child: Text(
                        "${l10n.oTPTest}: ${cubit.authRepository.otpNumber}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700.copyWith(height: 1.75),
                      ),
                    ),
                    SizedBox(height: 36.v),
                    Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: CustomPinCodeTextField(
                        context: context,
                        // controller: cubit.oTPController,
                        onChanged: (value) {
                          log('value::$value');
                          cubit.oTPController.text = value;
                          log('cubit.oTPController::${cubit.oTPController.text}');
                        },
                      ),
                    ),
                    SizedBox(height: 25.v),
                    ResendTimer(cubit: cubit),
                    SizedBox(height: 70.v),
                    state.submissionStatus == SubmissionStatus.inProgress
                        ? MainLoading()
                        : CustomElevatedButton(
                            onPressed: () => cubit.onSubmit(context: context),
                            text: l10n.scontinue,
                          ),
                    SizedBox(height: 5.v)
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
