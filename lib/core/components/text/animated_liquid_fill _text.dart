import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AnimateLiquidFillText extends StatelessWidget {
  const AnimateLiquidFillText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: TextLiquidFill(
        text: text,
        waveColor: AppColors.activeColor,
        boxBackgroundColor: Colors.white,
        textStyle: style,
        boxHeight: 60,
      ),
    );
  }
}
