import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

const colorizeColors = [
  AppColors.fontColor,
  AppColors.activeColor,
  AppColors.inActiveColor,
];

class AnimateColorizeText extends StatelessWidget {
  const AnimateColorizeText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 250.0,
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            text,
            textStyle: style,
            colors: colorizeColors,
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
    );
  }
}
