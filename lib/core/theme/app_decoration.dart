import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/theme/theme_helper.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

class AppDecoration {
  // Fill decorations

  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue5049,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );

  static BoxDecoration get fillBlueGrayC => BoxDecoration(
        color: appTheme.blueGray50C9,
      );

  static BoxDecoration get fillBluegray50c901 => BoxDecoration(
        color: appTheme.blueGray50C901,
      );

  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal5049,
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );

  // Gray decorations
  static BoxDecoration get gray100 => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray200 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray2001 => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray90035 => BoxDecoration(
        color: appTheme.blueGray50C9,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray90035,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              -5,
              8,
            ),
          ),
        ],
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  // Primary decorations
  static BoxDecoration get primary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.whiteA700,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );

  static BorderRadius get circleBorder41 => BorderRadius.circular(
        41.h,
      );

  static BorderRadius get circleBorder54 => BorderRadius.circular(
        54.h,
      );

  static BorderRadius get circleBorder70 => BorderRadius.circular(
        70.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL8 => BorderRadius.vertical(
        bottom: Radius.circular(8.h),
      );

  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
