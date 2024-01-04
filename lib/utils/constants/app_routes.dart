import 'package:get/get.dart';
import 'package:pokedex/features/details/view/details_page.dart';
import 'package:pokedex/features/home/view/home_page.dart';
import 'package:pokedex/features/splash/view/splash_page.dart';

abstract class AppRoutes{
  AppRoutes._();
  static const splash = "/";
  static const home="/home";
  static const details="/details";

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: ()=> SplashPage(),),
    GetPage(name: AppRoutes.home, page: ()=> HomePage(),),
    GetPage(name: AppRoutes.details, page: ()=> DetailPage(),),
  ];
}