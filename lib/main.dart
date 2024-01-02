import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/utils/constants/app_routes.dart';
import 'package:pokedex/utils/constants/app_strings.dart';
import 'package:pokedex/utils/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
    );
  }
}
