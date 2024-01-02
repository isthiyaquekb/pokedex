import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/features/splash/controller/splash_controller.dart';
import 'package:pokedex/utils/constants/app_assets.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final splashController=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Lottie.asset(AppAssets.lottieSplash),
        ),
      ),
    );
  }
}
