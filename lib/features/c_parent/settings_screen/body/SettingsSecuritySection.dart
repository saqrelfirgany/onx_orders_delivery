import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../../../core/theme/app_decoration.dart';
import '../../../../core/theme/theme_helper.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../route/app_route_names.dart';

class SettingsSecuritySection extends StatelessWidget {
  const SettingsSecuritySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.v, bottom: 1.v),
      decoration: AppDecoration.outlineGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.push(AppRouteName.loggedInDevicesScreenRoute);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 22.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Logged in Devices",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 1.v),
                  Text(
                    "1 Device",
                    style: theme.textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 18.adaptSize,
            width: 18.adaptSize,
            margin: EdgeInsets.only(
              top: 11.v,
              bottom: 35.v,
            ),
          ),
        ],
      ),
    );
  }
}
