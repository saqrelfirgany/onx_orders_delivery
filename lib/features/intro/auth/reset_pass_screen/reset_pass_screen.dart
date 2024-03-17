import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';
import 'package:saqrelfirgany/features/intro/auth/reset_pass_screen/reset_cubit.dart';

import '../../../../core/components/app_bar/back_app_bar.dart';
import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<ResetCubit>(
      create: (context) => ResetCubit(),
      child: BlocConsumer<ResetCubit, ResetState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ResetCubit>();
          return Scaffold(
            extendBody: true,
            appBar: BackAppBar(title: l10n.resetPassword),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      controller: cubit.passController,
                      hintText: l10n.newPassword,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: cubit.confPassController,
                      hintText: l10n.confirmNewPassword,
                      textInputType: TextInputType.text,
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.h,
                        vertical: 16.v,
                      ),
                    ),
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
