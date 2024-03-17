import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import '../../widgets/custom_elevated_button.dart';

class AppConfirmButton extends StatelessWidget {
  const AppConfirmButton({
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
    return CustomElevatedButton(
      text: title,
      onPressed: onTap,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
        // bottom: 64.v,
      ),
    );
    //   GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     height: height,
    //     // width: double.infinity,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       gradient: const LinearGradient(
    //         colors: [
    //           AppColors.buttonColor,
    //           AppColors.fontColor,
    //         ],
    //         begin: Alignment.bottomCenter,
    //         end: Alignment.topCenter,
    //         stops: [0.0, 1.0],
    //         tileMode: TileMode.clamp,
    //       ),
    //     ),
    //     child: Center(
    //       child: Text(
    //         title,
    //         style: AppFonts.fontW700(color: Colors.white),
    //       ),
    //     ),
    //   ),
    // );
  }
}
