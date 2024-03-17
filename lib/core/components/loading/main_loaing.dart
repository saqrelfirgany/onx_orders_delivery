import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constants/colors.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      color: AppColors.fontColor,
      size: size,
    );
  }
}

class CenterMainLoading extends StatelessWidget {
  const CenterMainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainLoading(),
    );
  }
}
