import 'dart:async';

import 'package:get/get.dart';
import 'package:pokedex/utils/constants/app_routes.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3),() =>navigateToHome());
  }

  navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

}