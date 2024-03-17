import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/controllers/language_cubit.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/widgets/custom_image_view.dart';

class SettingsSupportSection extends StatelessWidget {
  const SettingsSupportSection({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.gray90001,
            ),
          ),
          CustomImageView(
            imagePath: languageCubit.local == 'ar' ? ImageConstant.imgArrowLeft : ImageConstant.imgArrowRight,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(bottom: 5.v),
          ),
        ],
      ),
    );
  }
}
