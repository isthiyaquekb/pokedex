import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants/app_colors.dart';
import 'package:pokedex/utils/themes/ThemeWidgets/text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.primaryLightColor,
        secondary: AppColors.primaryLightColor,
        background: AppColors.scaffoldLightColor,
        secondaryContainer: Colors.green),
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
    textTheme: AppTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        primary: AppColors.primaryDarkColor,
        secondary: AppColors.primaryDarkColor,
        background: AppColors.scaffoldDarkColor,
        secondaryContainer: Colors.blue),

    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    textTheme: AppTextTheme.darkTextTheme,

  );
}
