import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/utils/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    displayMedium: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    displaySmall: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 20,
        fontWeight: FontWeight.w400
    ),
    titleLarge: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    titleMedium: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    titleSmall: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 12,
        fontWeight: FontWeight.w400
    ),

    labelMedium: GoogleFonts.exo2(
      color: AppColors.textLightColor,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    labelSmall: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 14,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 18,
        fontWeight: FontWeight.normal
    ),
    bodyMedium: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodySmall: GoogleFonts.exo2(
        color: AppColors.textLightColor,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 34,
        fontWeight: FontWeight.w700
    ),
    displayMedium: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),
    displaySmall: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.w400
    ),
    titleLarge: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.w400
    ),
    titleMedium: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    titleSmall: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 12,
        fontWeight: FontWeight.w400
    ),
    labelMedium: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    labelSmall: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 18,
        fontWeight: FontWeight.normal
    ),
    bodyMedium: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodySmall: GoogleFonts.exo2(
        color: AppColors.textDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.normal
    ),
  );
}