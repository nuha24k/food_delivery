import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFF252525);
  static const Color surfaceVariant = Color(0xFF2E2E2E);
  static const Color primary = Color(0xFFFFC107);
  static const Color primaryDark = Color(0xFFE5A800);
  static const Color onPrimary = Color(0xFF1A1A1A);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color textHint = Color(0xFF616161);
  static const Color cardBackground = Color(0xFF2A2A2A);
  static const Color divider = Color(0xFF333333);
  static const Color star = Color(0xFFFFC107);
  static const Color green = Color(0xFF4CAF50);
  static const Color red = Color(0xFFE53935);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onPrimary: AppColors.onPrimary,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      useMaterial3: true,
    );
  }
}
