import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts_helper.dart';

class TextEditWithTitleIcon extends StatelessWidget {
  const TextEditWithTitleIcon({
    super.key,
    required this.controller,
    this.title = '',
    this.hintText = '',
    this.icon,
    this.suffixIcon,
    this.enabled = true,
    this.obscureText = false,
    this.labelTitle = true,
    this.closeLabel = false,
    this.style,
    this.hintStyle,
    this.keyboardType,
    this.maxLines,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    ),
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool obscureText;
  final bool labelTitle;
  final bool closeLabel;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTitle
            ? const SizedBox()
            : title.isEmpty
                ? const SizedBox()
                : Text(
                    title,
                    style: style ?? AppFonts.fontW700(),
                  ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            // prefixIcon: Icon(icon, color: AppColors.fontColor),
            hintText: hintText.isEmpty ? title : hintText,
            suffixIcon: suffixIcon,
            hintStyle: hintStyle ?? AppFonts.fontW300(),
            label: closeLabel
                ? null
                : Text(
                    title,
                    style: style ?? AppFonts.fontW400(),
                  ),
            border: InputBorder.none,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.activeColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.inActiveColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.inActiveColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
