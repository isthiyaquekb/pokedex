import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/features/home/controller/home_controller.dart';
import 'package:pokedex/features/home/model/poke_model.dart';
import 'package:pokedex/utils/constants/app_assets.dart';
import 'package:pokedex/utils/constants/app_colors.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final homeController=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(()=>Stack(
        children:[
          Container(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 60.0,
            ),
            height: MediaQuery.of(context).size.height,
            color: homeController.isDarkMode.value
                ? AppColors.scaffoldDarkColor
                : AppColors.scaffoldLightColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: homeController.isDarkMode.value
                            ? AppColors.scaffoldLightColor
                            : AppColors.scaffoldDarkColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children:homeController.pokeList[homeController.selectedPokeList.value].type.map((e) => Center(
                    child: SvgPicture.asset(e == Type.BUG
                        ? AppAssets.typeBugIcon
                        : e == Type.DARK
                        ? AppAssets.typeDarkIcon
                        : e == Type.DRAGON
                        ? AppAssets.typeDragonIcon
                        : e == Type.ELECTRIC
                        ? AppAssets.typeElectricIcon
                        : e == Type.FAIRY
                        ? AppAssets.typeFairyIcon
                        : e == Type.FIGHTING
                        ? AppAssets.typeFightIcon
                        : e == Type.FIRE
                        ? AppAssets.typeFireIcon
                        : e == Type.FLYING
                        ? AppAssets.typeFlyingIcon
                        : e == Type.GHOST
                        ? AppAssets.typeGhostIcon
                        : e == Type.GRASS
                        ? AppAssets.typeGrassIcon
                        : e == Type.GROUND
                        ? AppAssets.typeGroundIcon
                        : e == Type.ICE
                        ? AppAssets.typeIceIcon
                        : e == Type.NORMAL
                        ? AppAssets.typeNormalIcon
                        : e == Type.POISON
                        ? AppAssets.typePoisonIcon
                        : e == Type.PSYCHIC
                        ? AppAssets.typePsychicIcon
                        : e == Type.ROCK
                        ? AppAssets.typeRockIcon
                        : e == Type.STEEL
                        ? AppAssets.typeSteelIcon
                        : AppAssets.typeWaterIcon,height: 60,width: 60,fit: BoxFit.cover,),
                  )).toList(),
                ),
                const SizedBox(height: 5.0),
                Text(
                  homeController.pokeList[homeController.selectedPokeList.value].name,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge,
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'HEIGHT',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'WEIGHT',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        homeController.pokeList[homeController.selectedPokeList.value].height,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        homeController.pokeList[homeController.selectedPokeList.value].weight,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'SPAWN TIME',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium,
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${homeController.pokeList[homeController.selectedPokeList.value].spawnTime} hr",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 60.0,
            child: Hero(
              tag: homeController.pokeList[homeController.selectedPokeList.value].img,
              child: CachedNetworkImage(
                imageUrl: homeController.pokeList[homeController.selectedPokeList.value].img,
                height: 280.0,
                width: 280.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: 0.0,
              left: 0.0,
              bottom: -40.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: homeController.isDarkMode.value?Colors.white30:Colors.black12,
                        offset: const Offset(0.0,6.0),
                        blurRadius: 0.8,
                        spreadRadius: 0.2
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(34.0),
                  child: InkWell(
                      onTap: () {
                        // _overViewBottomSheet(context);
                      },
                      child: const Text(
                        "GET OVERVIEW",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ))
        ],
      )),
    );
  }
}
