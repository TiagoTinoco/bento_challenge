import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(102, 51, 153, .1),
  100: const Color.fromRGBO(102, 51, 153, .2),
  200: const Color.fromRGBO(102, 51, 153, .3),
  300: const Color.fromRGBO(102, 51, 153, .4),
  400: const Color.fromRGBO(102, 51, 153, .5),
  500: const Color.fromRGBO(102, 51, 153, .6),
  600: const Color.fromRGBO(102, 51, 153, .7),
  700: const Color.fromRGBO(102, 51, 153, .8),
  800: const Color.fromRGBO(102, 51, 153, .9),
  900: const Color.fromRGBO(102, 51, 153, 1),
};

abstract class BentoColors {
  static MaterialColor primary = MaterialColor(0xFF663399, _swatchOpacity);
  static Color secondary = const Color(0xFFFFB600);
  static Color warning = const Color(0xFFC94949);
}
