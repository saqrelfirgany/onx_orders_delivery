import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimateWriterText extends StatelessWidget {
  const AnimateWriterText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: style,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(text, speed: const Duration(milliseconds: 600)),
            // TypewriterAnimatedText('Design first, then code'),
            // TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
            // TypewriterAnimatedText('Do not test bugs out, design them out'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
    // return SizedBox(
    //   width: 250.0,
    //   child: TextLiquidFill(
    //     text: text,
    //     waveColor: AppColors.activeColor,
    //     boxBackgroundColor: Colors.white,
    //     textStyle: style,
    //     boxHeight: 60,
    //   ),
    // );
  }
}
