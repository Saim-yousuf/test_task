import 'package:flutter/material.dart';

class Palette {
  /// =========================
  /// Primary Theme Color
  /// =========================
  static const MaterialColor themeColor = MaterialColor(
    0xFF32A9B7,
    <int, Color>{
      50: Color(0xFFE6F5F7),
      100: Color(0xFFC1E6EB),
      200: Color(0xFF9AD6DE),
      300: Color(0xFF73C6D1),
      400: Color(0xFF55B9C7),
      500: Color(0xFF32A9B7), // MAIN
      600: Color(0xFF2E9AA7),
      700: Color(0xFF288795),
      800: Color(0xFF227483),
      900: Color(0xFF165561),
    },
  );

  /// =========================
  /// Core Colors
  /// =========================
  static const Color primary = Color(0xFF32A9B7);
  static const Color secondary = Color(0xFF1B3D45);

  static const Color background = Color(0xFF000000);
  static const Color card = Color(0xFF18181C);

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  /// =========================
  /// Text Colors
  /// =========================
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF9AA0A6);
  static const Color textMuted = Color(0xFF6B6B6B);

  /// =========================
  /// Status Colors
  /// =========================
  static const Color success = Color(0xFF10CE8F);
  static const Color error = Color(0xFFF9113B);
  static const Color warning = Color(0xFFFCBE47);
  static const Color info = Color(0xFF32A9B7);

  /// =========================
  /// UI Elements
  /// =========================
  static const Color divider = Color(0xFF262626);
  static const Color border = Color(0xFF2E2E2E);
  static const Color inputBackground = Color(0xFF121212);

  /// =========================
  /// Normal Solid Colors
  /// =========================
  static const Color green = Color(0xFF37B44E);
  static const Color greenLight = Color(0xFFB2CCB3);
  static const Color greenDark = Color(0xFF1F4B43);

  static const Color blue = Color(0xFF1877F2);
  static const Color blueLight = Color(0xFF63A3FF);
  static const Color blueDark = Color(0xFF005694);

  static const Color orange = Color(0xFFF09F33);
  static const Color orangeLight = Color(0xFFFFC16A);
  static const Color orangeDark = Color(0xFFB06B00);

  static const Color red = Color(0xFFF9113B);
  static const Color yellow = Color(0xFFFCBE47);
  static const Color purple = Color(0xFF800080);
  static const Color pink = Color(0xFFEC008C);

  /// =========================
  /// Gradients
  /// =========================
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF32A9B7),
      Color(0xFF1B3D45),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF18181C),
      Color(0xFF0F0F12),
    ],
  );
}
