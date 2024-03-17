import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/theme/theme_helper.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

import 'colors.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

/// MontserratSemiBold
/// MontserratMedium
/// MontserratRegular
class CustomTextStyles {
  static get title29MainColorSemiBold {
    return TextStyle(
      fontSize: 29.fSize,
      color: mainColor,
      fontFamily: 'MontserratSemiBold',
    );
  }

  static get title12MainColorMedium {
    return TextStyle(
      fontSize: 12.fSize,
      color: mainColor,
      fontFamily: 'MontserratMedium',
    );
  }

  static get title14BlackColorRegular {
    return TextStyle(
      fontSize: 14.fSize,
      color: blackColor,
      fontFamily: 'MontserratRegular',
    );
  }

  static get title14WhiteColorMedium {
    return TextStyle(
      fontSize: 14.fSize,
      color: whiteColor,
      fontFamily: 'MontserratMedium',
    );
  }

  // Body text style
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: appTheme.secondary,
      );

  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static get bodySmallBluegray70001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray70001,
        fontWeight: FontWeight.w400,
      );

  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );

  static get bodySmallRegular => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );

  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );

  static get bodyLargeBluegray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray700,
      );

  static get bodyLargeBluegray70001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get bodyLargeBluegray700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray700,
      );

  static get bodyLargeGray90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90001,
      );

  static get bodyLargeGray9000118 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90001,
        fontSize: 18.fSize,
      );

  static get bodyLargeGray90001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray90001,
      );

  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyLargeRoboto => theme.textTheme.bodyLarge!.roboto;

  static get bodyMediumBluegray70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get bodySmallBluegray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w400,
      );

  static get bodyMediumBluegray70001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );

  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w300,
      );

  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w300,
      );

  // Title text style
  static get titleMediumPrimary18 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );

  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumBluegray70001SemiBold_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeBluegray70001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get titleLargeBluegray70001SemiBold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray70001,
        fontWeight: FontWeight.w600,
      );

  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );

  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );

  static get titleMediumBluegray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBluegray70001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumBluegray70001_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get titleMediumBluegray70001_2 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray70001,
      );

  static get titleMediumBluegray700SemiBold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 18.fSize,
      );

  static get titleMediumGray500Bold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumGray500SemiBold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumGray500SemiBold18 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumGray500_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
      );

  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static get titleMediumSemiBold18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get titleMediumWhiteA70018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );

  static get titleMediumWhiteA700SemiBold => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
