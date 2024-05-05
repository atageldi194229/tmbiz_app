// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
class AppColors {
  /// Primary color
  static const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE0EAF3),
    100: Color(0xFFB3CBE2),
    200: Color(0xFF80A9CF),
    300: Color(0xFF4D86BB),
    400: Color(0xFF266CAD),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF004B96),
    700: Color(0xFF00418C),
    800: Color(0xFF003882),
    900: Color(0xFF002870),
  });

  static const int _primaryPrimaryValue = 0xFF00529E;

  /// Primary accent color
  static const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF9FB9FF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF396EFF),
    700: Color(0xFF1F5BFF),
  });

  static const int _primaryAccentValue = 0xFF6C93FF;

  /// Secondary color
  static const MaterialColor secondary = MaterialColor(_secondaryPrimaryValue, <int, Color>{
    50: Color(0xFFF6F6F6),
    100: Color(0xFFE7E7E8),
    200: Color(0xFFD8D8D9),
    300: Color(0xFFC8C8CA),
    400: Color(0xFFBCBCBE),
    500: Color(_secondaryPrimaryValue),
    600: Color(0xFFA9A9AC),
    700: Color(0xFFA0A0A3),
    800: Color(0xFF97979A),
    900: Color(0xFF87878B),
  });

  static const int _secondaryPrimaryValue = 0xFFB0B0B3;

  /// Secondary accent color
  static const MaterialColor secondaryAccent = MaterialColor(_secondaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_secondaryAccentValue),
    400: Color(0xFFB8B8FF),
    700: Color(0xFF9E9EFF),
  });

  static const int _secondaryAccentValue = 0xFFECECFD;

  /// Background color
  static const Color backgroundLight = Color(0xFFFFFFFF);

  /// Dark Background color
  static const Color backgroundDark = Color(0xFF252836);

  /// Success color
  static const Color success = Color(0xFF0EC243);

  /// Danger color
  static const Color danger = Color(0xFFE50027);

  /// Hot color
  static const Color hot = Color(0xFFEE2750);

  /// Warning color
  static const Color warning = Color(0xFFF79009);

  /// White color
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Black color
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  /// Container color
  static const Color container = Color(0xFF1F1D2B);

  /// Border color
  static const Color border = Color(0xFF393C49);
}
