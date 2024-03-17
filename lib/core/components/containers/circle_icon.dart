import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.asset,
  });

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(8),
      margin: EdgeInsetsDirectional.only(end: 8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Image.asset(asset),
      ),
    );
  }
}
