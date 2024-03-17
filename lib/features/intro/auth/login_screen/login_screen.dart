import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../route/app_route_names.dart';
import 'body/login_logo_and_language.dart';
import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            extendBody: true,
            // resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  /// Logo And Language Section
                  LoginLogoAndLanguage(),
                  SizedBox(height: 132.v),

                  /// Welcome Back!
                  Text(
                    l10n.welcomeLogin,
                    style: CustomTextStyles.title29MainColorSemiBold,
                  ),
                  SizedBox(height: 12.v),
                  Text(
                    l10n.logBackIntoYourAccount,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.title12MainColorMedium,
                  ),
                  SizedBox(height: 44.v),

                  /// User ID Field
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.h,
                    ),
                    child: CustomTextFormField(
                      controller: cubit.userNameController,
                      hintText: l10n.userID,
                      fillColor: inputColor,
                      hintStyle: CustomTextStyles.title14BlackColorRegular,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 8.v),

                  /// Password Field
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 16.h,
                    ),
                    child: CustomTextFormField(
                      controller: cubit.passwordController,
                      hintText: l10n.password,
                      fillColor: inputColor,
                      hintStyle: CustomTextStyles.title14BlackColorRegular,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(height: 44.v),

                  /// Login Button
                  state.submissionStatus == SubmissionStatus.inProgress
                      ? MainLoading()
                      : Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 16.h,
                          ),
                          child: CustomElevatedButton(
                            text: l10n.login,
                            onPressed: () {
                              // cubit.onSubmit(context: context);
                              context.push(AppRouteName.mainScreenRoute);
                            },
                          ),
                        ),
                  SizedBox(height: 62.v),

                  /// Login Delivery Logo
                  CustomImageView(
                    imagePath: 'assets/login/login_delivery.svg',
                    width: 194.adaptSize,
                    height: 170.adaptSize,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
