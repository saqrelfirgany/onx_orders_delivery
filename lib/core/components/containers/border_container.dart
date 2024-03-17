import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
    this.width = 120,
    this.height = 40,
    this.margin,
    this.padding = const EdgeInsetsDirectional.symmetric(vertical: 8),
    this.color = AppColors.fontColor,
    this.backgroundColor,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
        ),
      ),
      child: child,
    );
  }
}
