import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget(context),
          )
        : buildElevatedButtonWidget(context);
  }

  Widget buildElevatedButtonWidget(context) {
    return Container(
      height: height ?? 58.v,
      width: width ?? double.maxFinite,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: buttonStyle ?? theme.elevatedButtonTheme.style,
        onPressed: isDisabled ?? false ? null : onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 4.h),
              child: leftIcon ?? const SizedBox.shrink(),
            ),
            Text(
              text,
              style: buttonTextStyle ?? CustomTextStyles.title14WhiteColorMedium,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 4.h),
              child: rightIcon ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
