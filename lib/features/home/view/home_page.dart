import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/features/home/controller/home_controller.dart';
import 'package:pokedex/features/home/model/poke_model.dart';
import 'package:pokedex/utils/constants/app_assets.dart';
import 'package:pokedex/utils/constants/app_colors.dart';
import 'package:pokedex/utils/constants/app_dimens.dart';
import 'package:pokedex/utils/constants/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: -60,
            child: Obx(() => Image(
                  image: const AssetImage(AppAssets.noImage),
                  height: 340,
                  width: 340,
                  opacity: homeController.isDarkMode.value
                      ? const AlwaysStoppedAnimation(.4)
                      : const AlwaysStoppedAnimation(8.0),
                )),
          ),
          Positioned(
              top: 50,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingHorizontal32),
                child: InkWell(
                  onTap: () {
                    homeController.toggleDarkMode();
                  },
                  child: SvgPicture.asset(
                    homeController.isDarkMode.value
                        ? AppAssets.sunIcon
                        : AppAssets.moonIcon,
                    height: 24,
                    width: 24,
                    color: homeController.isDarkMode.value
                        ? AppColors.textDarkColor
                        : AppColors.primaryDarkColor,
                  ),
                ),
              )),
          Positioned(
            top: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingHorizontal32),
              child: Text(
                "Select Your",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingHorizontal32),
              child: Text(
                "Pokémon",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingHorizontal32),
              child: Text(
                "Type",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: SizedBox(
                height: 60,
                child: Obx(
                  () => ListView(
                    scrollDirection: Axis.horizontal,
                    children: homeController.typeList
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4),
                              child: InkWell(
                                onTap: () {
                                  homeController.filterPokeListByType(e.name);
                                },
                                child: Container(
                                  height: 40,width: 40,
                                  decoration: BoxDecoration(
                                      color: homeController.isDarkMode.value
                                          ? AppColors.scaffoldDarkColor
                                          : AppColors.scaffoldLightColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: homeController.isDarkMode.value?Colors.white30:Colors.black12,
                                            offset: const Offset(0.0,0.0),
                                            blurRadius: 0.8,
                                          spreadRadius: 1.5
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
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
                                            : AppAssets.typeWaterIcon),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )),
          ),
          Positioned(
              top: 280,
              child: SizedBox(
                height: 320,
                width: MediaQuery.of(context).size.width,
                child: GetBuilder<HomeController>(
                  builder: (controller) => controller.filterPokeList.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.filterPokeList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 60,bottom: 20),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: homeController.isDarkMode.value
                                          ? AppColors.scaffoldDarkColor
                                          : AppColors.scaffoldLightColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: homeController.isDarkMode.value?Colors.white30:Colors.black12,
                                            offset: const Offset(0.0,6.0),
                                            blurRadius: 0.8,
                                            spreadRadius: 0.2
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 80.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            controller
                                                .filterPokeList[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children:controller.filterPokeList[index].type.map((e) => Center(
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
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Height",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      controller
                                                          .filterPokeList[index]
                                                          .height,
                                                      style: const TextStyle(
                                                          color: Colors.amber,
                                                          fontSize: AppDimens
                                                              .textSize18,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Weight",
                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                    ),
                                                    Text(
                                                      controller
                                                          .filterPokeList[index]
                                                          .weight,
                                                      style: const TextStyle(
                                                          color: Colors.amber,
                                                          fontSize: AppDimens
                                                              .textSize18,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          controller.filterPokeList[index].img,
                                      height: 140,
                                      width: 140,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : controller.pokeList.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.pokeList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      homeController.selectedIndex(index);
                                      Get.toNamed(AppRoutes.details);
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 60,bottom: 20),
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: homeController.isDarkMode.value
                                                ? AppColors.scaffoldDarkColor
                                                : AppColors.scaffoldLightColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: homeController.isDarkMode.value?Colors.white30:Colors.black12,
                                                  offset: const Offset(0.0,6.0),
                                                  blurRadius: 0.8,
                                                  spreadRadius: 0.2
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsets.only(top: 80.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller
                                                      .pokeList[index].name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children:controller.pokeList[index].type.map((e) => Center(
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 16.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Height",
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                          ),
                                                          Text(
                                                            controller
                                                                .pokeList[index]
                                                                .height,
                                                            style: const TextStyle(
                                                                color:
                                                                    Colors.amber,
                                                                fontSize: AppDimens
                                                                    .textSize18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Weight",
                                                            style:
                                                                Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                          ),
                                                          Text(
                                                            controller
                                                                .pokeList[index]
                                                                .weight,
                                                            style: const TextStyle(
                                                                color:
                                                                    Colors.amber,
                                                                fontSize: AppDimens
                                                                    .textSize18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          child: Hero(
                                            tag: controller.pokeList[index].img,
                                            child: CachedNetworkImage(
                                              imageUrl: controller
                                                  .pokeList[index].img,
                                              height: 140,
                                              width: 140,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : const SizedBox.shrink(),
                ),
              ))
        ],
      ),
    );
  }
}
