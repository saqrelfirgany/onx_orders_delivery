import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';
import 'package:saqrelfirgany/features/c_parent/settings_screen/body/updateProfileBottomSheet.dart';

import '../../../../core/controllers/language_cubit.dart';
import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../route/app_route_names.dart';
import '../Settings_cubit.dart';

class SettingsNamePhoneSection extends StatelessWidget {
  const SettingsNamePhoneSection({
    super.key,
    required this.cubit,
  });

  final SettingsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCubit = context.read<LanguageCubit>();

    return Container(
      decoration: AppDecoration.outlineGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.name, style: theme.textTheme.titleMedium),
                  SizedBox(height: 3.v),
                  Text(
                    cubit.parentModel.parentsName,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  updateProfileBottomSheet(context: context, cubit: cubit);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 15.v, bottom: 12.v),
                  child: Text(
                    l10n.tapUpdate,
                    style: theme.textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath:
                    languageCubit.local == 'ar' ? ImageConstant.imgArrowLeft : ImageConstant.imgArrowRight,
                height: 18.adaptSize,
                width: 18.adaptSize,
                margin: EdgeInsets.only(left: 8.h, top: 13.v, bottom: 13.v),
              ),
            ],
          ),
          SizedBox(height: 23.v),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.phoneNumber,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "+966 ${cubit.parentModel.parentsPhone}",
                    style: theme.textTheme.bodySmall,
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.push(AppRouteName.changeNumberScreenRoute);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 15.v, bottom: 12.v),
                  child: Text(
                    l10n.tapUpdate,
                    style: theme.textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath:
                    languageCubit.local == 'ar' ? ImageConstant.imgArrowLeft : ImageConstant.imgArrowRight,
                height: 18.adaptSize,
                width: 18.adaptSize,
                margin: EdgeInsets.only(left: 8.h, top: 13.v, bottom: 13.v),
              ),
            ],
          ),
          SizedBox(height: 24.v),
          Text(
            l10n.email,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 5.v),
          Text(
            cubit.parentModel.parentsEmail,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 22.v)
        ],
      ),
    );
  }
}
