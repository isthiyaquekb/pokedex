import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex/features/home/model/poke_model.dart';
import 'package:pokedex/services/api_end_points.dart';
import 'package:pokedex/services/network_client.dart';
import 'package:pokedex/utils/constants/app_keys.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(viewportFraction: 0.5);
  final storageBox = GetStorage();
  var currentPageValue = 0.0.obs;
  var selectedPokeList = 0.obs;
  var isDarkMode = false.obs;
  var currentPageIndex = 1.obs;
  var pokeList = <Pokemon>[].obs;
  var filterPokeList = <Pokemon>[].obs;
  var allTypeList = <Type>[].obs;
  var typeList = <Type>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPokeDex();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    pageController.addListener(() {
      currentPageValue.value = pageController.page!;
    });
    update();
  }

  void changePageIndex(int index) {
    currentPageIndex.value = index;
    update();
  }

  void selectedIndex(int index) {
    selectedPokeList.value = index;
    update();
  }


  void getPokeDex() async {
    try {
      var response = await NetworkClient()
          .get(ApiEndPoints.devBaseUrl, ApiEndPoints.pokeDex)
          .catchError(NetworkClient().handleError);
      if (response != null) {
        var pokeResponse = PokeModel.fromMap(response);
        pokeList.value = pokeResponse.pokemon;
        allTypeList.clear();
        for (int i = 0; i < pokeList.length; i++) {
          allTypeList.addAll(pokeList[i].type);
          // print("type name${typeList[i].name}");
        }
        typeList.value = allTypeList.toSet().toList();
        update();
      }
    } catch (e) {
      log("Exception:${e.toString()}");
    }
  }

  void filterPokeListByType(String query) {
    log("SEARCH QUERY:$query");
    filterPokeList.clear();
    for(int i=0;i<pokeList.length;i++){
      var element = pokeList[i];
      var filter = element.type
          .where((type) => type.name.toUpperCase() == query.toUpperCase())
          .toList();

      if (filter.isNotEmpty) {
        // Add the Pokémon to the filtered list only if it has the specified type
        filterPokeList.add(element);
        log("SEARCH FILTER:${filterPokeList.length}");
        update();
      }
    }
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      log("THEME DARK");
      Get.changeThemeMode(ThemeMode.dark);
      storageBox.write(AppKeys.keyIsDark, isDarkMode.value);
    } else {
      log("THEME LIGHT");
      Get.changeThemeMode(ThemeMode.light);
      storageBox.write(AppKeys.keyIsDark, isDarkMode.value);
    }
    update();
  }
}
