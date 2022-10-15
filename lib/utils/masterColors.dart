import 'package:flutter/material.dart';

class MasterColors{
  static const Color primaryBlue = Color.fromARGB(255, 232, 96, 70);
  static const Color secondaryBlue = Color.fromARGB(255, 12, 209, 232);
  static const Color yellow = Color.fromARGB(255, 245, 189, 0);
  static const Color red = Color.fromARGB(255, 232, 96, 70);
  static const Color black = Color.fromARGB(255, 56, 72, 84);
  static const BackgroundIntroColor = Color.fromARGB(255, 58, 74, 85);
  static const _greyColor = 0xFF878987;

  static const MaterialColor grey = const MaterialColor(_greyColor, const <int, Color>{
    0: const Color(0xFFF4F4F4),
    50: const Color(0xFFEFEFEF),
    100: const Color(0xFFB8B8B8),
    400: const Color(_greyColor),
    700: const Color(0xFF5D5D5D),
    900: const Color(0xFF333333),
  });
}