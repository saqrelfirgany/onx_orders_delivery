import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../../core/controllers/language_cubit.dart';
import '../../../../../core/theme/custom_text_style.dart';
import '../../../../../core/widgets/custom_image_view.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../route/app_route_names.dart';

class LoginLogoAndLanguage extends StatelessWidget {
  const LoginLogoAndLanguage({
    super.key,
  });

  void _showLanguageBottomSheet({required BuildContext context}) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = BlocProvider.of<LanguageCubit>(context);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  l10n.english,
                  style: CustomTextStyles.titleSmallGray500,
                ),
                onTap: () {
                  _changeLanguageAndNavigate(
                    context: context,
                    newLanguage: 'en',
                    languageCubit: languageCubit,
                  );
                },
              ),
              ListTile(
                title: Text(
                  l10n.arabic,
                  style: CustomTextStyles.titleSmallGray500,
                ),
                onTap: () {
                  _changeLanguageAndNavigate(
                    context: context,
                    newLanguage: 'ar',
                    languageCubit: languageCubit,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguageAndNavigate({
    required BuildContext context,
    required String newLanguage,
    required LanguageCubit languageCubit,
  }) async {
    if (newLanguage == languageCubit.local) return;
    await languageCubit.changeLanguage(newLanguage);
    context.go(AppRouteName.splashScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    final languageCubit = BlocProvider.of<LanguageCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 26.h,
            top: 56.v,
          ),
          child: CustomImageView(
            imagePath: 'assets/login/login_OnxRestaurant_Logo.svg',
            width: 171.adaptSize,
            height: 73.adaptSize,
          ),
        ),
        Stack(
          children: [
            CustomImageView(
              imagePath: languageCubit.local == 'en'
                  ? 'assets/login/login_ic_circle.svg'
                  : 'assets/login/login_ic_language_ar_x2.png',
              width: 121.adaptSize,
              height: 127.adaptSize,
              fit: BoxFit.fill,
            ),

            /// Language Icon
            PositionedDirectional(
              end: 16.h,
              top: 50.v,
              child: GestureDetector(
                onTap: () {
                  _showLanguageBottomSheet(context: context);
                },
                child: CustomImageView(
                  imagePath: 'assets/login/login_ic_language.svg',
                  width: 27.adaptSize,
                  height: 27.adaptSize,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
