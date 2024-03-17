import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/controllers/language_cubit.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../route/app_route_names.dart';

class SettingsAppearanceSection extends StatelessWidget {
  const SettingsAppearanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = BlocProvider.of<LanguageCubit>(context);

    return Container(
      padding: EdgeInsets.only(top: 3.v, bottom: 2.v),
      decoration: AppDecoration.outlineGray,
      child: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(right: 7.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(l10n.darkMode, style: theme.textTheme.titleMedium),
          //       CustomSwitch(
          //         margin: EdgeInsets.only(bottom: 2.v),
          //         value: false,
          //         // value: isSelectedSwitch,
          //         onChange: (value) {
          //           // isSelectedSwitch = value;
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 29.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.changeLanguage, style: theme.textTheme.titleMedium),
              Spacer(),
              DropdownButton<String>(
                value: languageCubit.state.locale.toString(),
                onChanged: (String? newLanguage) async {
                  // return;
                  log('newLanguage::$newLanguage');
                  if (newLanguage != null) {
                    await languageCubit.changeLanguage(newLanguage);
                    context.go(AppRouteName.splashScreenRoute);
                  }
                },
                underline: SizedBox(),
                icon: CustomImageView(
                  imagePath: ImageConstant.imgArrowDown,
                  height: 18.adaptSize,
                  width: 18.adaptSize,
                  margin: EdgeInsets.only(
                    left: 8.h,
                    top: 3.v,
                    bottom: 3.v,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'en',
                    child: Text(
                      l10n.english,
                      style: CustomTextStyles.titleSmallGray500,
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'ar',
                    child: Text(
                      l10n.arabic,
                      style: CustomTextStyles.titleSmallGray500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
