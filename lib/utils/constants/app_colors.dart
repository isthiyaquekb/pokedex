import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors{
  AppColors._();
  //DARK MODE
  static const primaryDarkColor= Color(0xff1a1f41);
  static const typeDarkColor= Color(0xff606dc2);
  static const scaffoldDarkColor= Color(0xff000000);
  static const textDarkColor= Color(0xffFFFFFF);
  static const textDarkGreyColor= Color(0xffB3B3B3);

  //LIGHT MODE
  static const primaryLightColor= Color(0xff606dc2);
  static const typeLightColor= Color(0xff1a1f41);
  static const scaffoldLightColor= Color(0xffFFFFFF);
  static const textLightColor= Color(0xff000000);
  static const textLightGreyColor= Color(0xffB3B3B3);

  static const borderColor= Color(0xbbd3d3d3);
}