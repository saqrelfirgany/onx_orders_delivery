import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../theme/app_decoration.dart';
import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarLeadingCircleimage extends StatelessWidget {
  AppbarLeadingCircleimage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.circleBorder36,
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 72.adaptSize,
          width: 72.adaptSize,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            36.h,
          ),
        ),
      ),
    );
  }
}
