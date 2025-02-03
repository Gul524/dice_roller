import 'package:flutter/material.dart';

bool kcDarkMode = false;
bool colorChange = true;

Color kcPrimaryColor = const Color.fromARGB(255, 52, 209, 248);
Color kcSecondaryColor = const Color.fromARGB(49, 59, 0, 127);
Color kcBgColor =
    (kcDarkMode) ? const Color(0xFF121212) : const Color(0xFFE0E0E0);
Color kcTextColor =
    (kcDarkMode) ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

List<Color> darkColorList = [
  const Color.fromARGB(255, 0, 182, 9),
  const Color.fromARGB(255, 185, 192, 0),
  const Color.fromARGB(255, 0, 17, 129),
  const Color.fromARGB(255, 127, 0, 0),
];

List<Color> lightColorList = [
  const Color.fromARGB(255, 101, 249, 111),
  const Color.fromARGB(255, 253, 253, 40),
  const Color.fromARGB(255, 41, 84, 255),
  const Color.fromARGB(255, 248, 61, 61),
];
