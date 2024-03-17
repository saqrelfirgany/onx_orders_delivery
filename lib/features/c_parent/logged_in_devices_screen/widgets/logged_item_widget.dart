import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/custom_text_style.dart';
import '../../../../core/theme/theme_helper.dart';

class LoggedItemWidget extends StatelessWidget {
  const LoggedItemWidget({Key? key, required this.currentDevice}) : super(key: key);
  final bool currentDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 23.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Generic Smartphone",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 1.v),
                Text(
                  "Android 0.0.0",
                  style: CustomTextStyles.bodySmallBluegray70001,
                ),
                SizedBox(height: 17.v),
                Text(
                  "Logged In Since",
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 3.v),
                Text(
                  "November 02 2023, 12:42 am",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          currentDevice
              ? Padding(
                  padding: EdgeInsets.only(
                    top: 41.v,
                    bottom: 42.v,
                  ),
                  child: Text(
                    "Current Device",
                    style: CustomTextStyles.bodySmallRegular,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    left: 33.h,
                    top: 2.v,
                  ),
                  child: Text(
                    "Log out",
                    style: CustomTextStyles.bodyLargePrimary.copyWith(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
