import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts_helper.dart';

class AppBorderButton extends StatelessWidget {
  const AppBorderButton({
    super.key,
    required this.title,
    this.onTap,
    this.height = 50,
  });

  final String title;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        // width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: AppColors.fontColor),
        ),
        child: Center(
          child: Text(
            title,
            style: AppFonts.fontW700(color: AppColors.fontColor),
          ),
        ),
      ),
    );
  }
}
