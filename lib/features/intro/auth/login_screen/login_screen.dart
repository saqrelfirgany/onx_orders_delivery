import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/components/loading/main_loaing.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/widgets/custom_checkbox_button.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../route/app_route_names.dart';
import 'login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  bool englishName = true;
  bool obscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 40.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40.v),
                    CustomImageView(
                      imagePath: 'assets/app_logo.png',
                      height: 160.adaptSize,
                      width: 160.adaptSize,
                      radius: BorderRadius.circular(80.h),
                    ),
                    SizedBox(height: 21.v),
                    Text(
                      l10n.welcomeLogin,
                      style: CustomTextStyles.titleMediumBluegray70001,
                    ),
                    SizedBox(height: 8.v),
                    Container(
                      width: 248.h,
                      margin: EdgeInsets.symmetric(horizontal: 47.h),
                      child: Text(
                        l10n.descriptionLogin,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray700.copyWith(
                          height: 1.75,
                        ),
                      ),
                    ),
                    SizedBox(height: 37.v),
                    CustomTextFormField(
                      controller: cubit.userNameController,
                      hintText: l10n.userName,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgUserGray500,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 58.v,
                      ),
                    ),
                    SizedBox(height: 16.v),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return CustomTextFormField(
                          controller: cubit.passwordController,
                          hintText: l10n.password,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 19.v, 10.h, 19.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgUnlock,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 58.v,
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              obscureText = !obscureText;
                              setState(() {});
                              log('saqr');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(30.h, 19.v, 12.h, 19.v),
                              child: CustomImageView(
                                imagePath: obscureText
                                    ? ImageConstant.imgSettingsOnprimary
                                    : ImageConstant.imgUnlock,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                              ),
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: 58.v,
                          ),
                          obscureText: obscureText,
                          contentPadding: EdgeInsets.symmetric(vertical: 17.v),
                        );
                      },
                    ),
                    SizedBox(height: 25.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: CustomCheckboxButton(
                                text: l10n.rememberMe,
                                value: englishName,
                                onChange: (value) {
                                  englishName = value;
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () => context.push(
                            AppRouteName.forgetPasswordScreenRoute,
                          ),
                          child: Text(
                            l10n.forgetPassword,
                            style: theme.textTheme.titleSmall!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: state.submissionStatus == SubmissionStatus.inProgress
                ? Padding(
                    padding: EdgeInsets.only(bottom: 64.v),
                    child: MainLoading(),
                  )
                : CustomElevatedButton(
                    text: l10n.login,
                    onPressed: () {
                      // cubit.onSubmit(context: context);
                      context.push(AppRouteName.mainScreenRoute);
                    },
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 16.h,
                      bottom: 64.v,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
