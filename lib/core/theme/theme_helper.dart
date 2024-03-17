import 'package:flutter/material.dart';
import 'package:saqrelfirgany/core/utils/size_utils.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {'primary': PrimaryColors()};

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {'primary': ColorSchemes.primaryColorScheme};

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have "
        "added this theme class in JSON Try "
        "running flutter pub run build_runner",
      );
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have "
        "added this theme class in JSON Try "
        "running flutter pub run build_runner",
      );
    }
    //return theme from map

    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      useMaterial3: false,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(width: 1),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 80,
        space: 80,
        color: appTheme.gray500,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 16.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray90001,
          fontSize: 14.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 44.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.whiteA70001,
          fontSize: 24.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray90001,
          fontSize: 20.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray90001,
          fontSize: 16.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray70001,
          fontSize: 14.fSize,
          fontFamily: 'SF Arabic Regular',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF092330),
    primaryContainer: Color(0X23000000),

    // On colors(text colors)
    onPrimary: Color(0XFF9CA7CC),
    onPrimaryContainer: Color(0XFF292D32),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get blue5049 => Color(0X49E4F1F7);

  // Black
  Color get black900 => const Color(0XFF000000);

  Color get secondary => const Color(0XFF39647A);

  // Blue
  Color get blueA100 => const Color(0XFF80B6FC);

  // BlueGrayC
  Color get blueGray50C9 => const Color(0XC9EAF1F5);

  Color get blueGray507c => const Color(0X7CEBF0F3);

  Color get blueGray50C901 => const Color(0XC9E9F1F5);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);

  Color get blueGray700 => const Color(0XFF4B5D66);

  Color get blueGray70001 => const Color(0XFF396479);

  Color get blueGray900 => const Color(0XFF152E51);

  // Gray
  Color get gray100 => const Color(0XFFF5F5F5);

  Color get gray200 => const Color(0XFFE9E9E9);

  Color get gray500 => const Color(0XFFA6A6A6);

  Color get gray900 => const Color(0XFF2F2B28);

  Color get gray90001 => const Color(0XFF212529);

  Color get gray90035 => const Color(0X35252525);

  // Grayc
  Color get gray8004c => const Color(0X4C3C3C43);

  // Red
  Color get red300 => const Color(0XFFBA8F62);

  // Teal
  Color get teal400 => const Color(0XFF32AE88);

  Color get teal50 => const Color(0XFFDCEFEE);

  Color get teal5049 => const Color(0X49E3F0F6);

  // White
  Color get whiteA700 => const Color(0XFFFBFCFF);

  Color get whiteA70001 => const Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();