import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/features/home/controller/home_controller.dart';

Widget pageViewWidget(HomeController controller,int index, double currentPageValue) {
  double angle = (currentPageValue - index) * (2 * pi / 10);

  return Transform(
    transform: Matrix4.identity()
      ..setEntry(3, 2, 0.001) // perspective
      ..rotateY(angle),
    child: Container(
      margin: const EdgeInsets.all(10),
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page ${controller.pokeList[index]}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    ),
  );
}