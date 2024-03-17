import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import 'base_button.dart';

class CustomElevatedButtonIcon extends BaseButton {
  const CustomElevatedButtonIcon({
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
            leftIcon ?? const SizedBox.shrink(),
            Text(
              text,
              style: buttonTextStyle ?? CustomTextStyles.titleMediumWhiteA70018,
            ),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
