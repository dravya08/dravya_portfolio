import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF0A0A0F);
  static const surface = Color(0xFF111118);
  static const surface2 = Color(0xFF1A1A24);
  static const border = Color(0x12FFFFFF);
  static const border2 = Color(0x22FFFFFF);
  static const textPrimary = Color(0xFFF0EEEE);
  static const textMuted = Color(0xFF7A7A8C);
  static const accent = Color(0xFF7B6EF6);
  static const accent2 = Color(0xFFA855F7);
  static const teal = Color(0xFF2DD4BF);
  static const amber = Color(0xFFF59E0B);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      );
}

class AppTextStyles {
  static TextStyle syne({
    double size = 16,
    FontWeight weight = FontWeight.w700,
    Color color = AppColors.textPrimary,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.syne(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle dmSans({
    double size = 16,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.dmSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle dmMono({
    double size = 13,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.accent,
    double? letterSpacing,
  }) =>
      GoogleFonts.dmMono(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
      );
}
