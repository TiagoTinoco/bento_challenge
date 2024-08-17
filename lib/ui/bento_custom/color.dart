import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(80, 225, 155, .1),
  100: const Color.fromRGBO(80, 225, 155, .2),
  200: const Color.fromRGBO(80, 225, 155, .3),
  300: const Color.fromRGBO(80, 225, 155, .4),
  400: const Color.fromRGBO(80, 225, 155, .5),
  500: const Color.fromRGBO(80, 225, 155, .6),
  600: const Color.fromRGBO(80, 225, 155, .7),
  700: const Color.fromRGBO(80, 225, 155, .8),
  800: const Color.fromRGBO(80, 225, 155, .9),
  900: const Color.fromRGBO(80, 225, 155, 1),
};

abstract class BentoColor {
  static MaterialColor primary = MaterialColor(0xFF51E09B, _swatchOpacity);
  static Color secondary = const Color(0xFF0F325A);
  static Color darkGreen = const Color(0xFFAAD4C3);
  static Color grey = const Color(0xFFF5F5F5);
  static Color yellow = const Color(0xFFFABE1F);
}
