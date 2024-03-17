import 'package:flutter/material.dart';

class ElevationContainer extends StatelessWidget {
  const ElevationContainer({
    super.key,
    required this.child,
    this.elevation = 4,
    this.width,
    this.height = 50,
    this.borderRadius = 8,
    this.margin,
    this.padding,
    this.color = Colors.white,
  });

  final Widget child;
  final double elevation;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
