import 'dart:math';
// import 'package:audioplayers/audioplayers.dart';
import 'package:dice/configs/colors.dart';
import 'package:dice/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController with GetTickerProviderStateMixin {
  final Random _random = Random();
  RxInt number_of_players = 4.obs;
  RxInt number_of_dices = 2.obs;
  int bgColorNumber = 0;

  RxBool isDarkMode = false.obs;
  RxBool changeColor = true.obs;

  Rx<Color> ScaffoldBgColor = kcLightBgColor.obs;

  RxList<int> dice = List.generate(6, (_) => 1).obs;

  List<Color> darkColors = [
    const Color.fromARGB(255, 0, 182, 9),
    const Color.fromARGB(255, 185, 192, 0),
    const Color.fromARGB(255, 0, 17, 129),
    const Color.fromARGB(255, 127, 0, 0),
  ];

  List<Color> lightColors = [
    const Color.fromARGB(255, 101, 249, 111),
    const Color.fromARGB(255, 253, 253, 40),
    const Color.fromARGB(255, 41, 84, 255),
    const Color.fromARGB(255, 248, 61, 61),
  ];

  void onMainPress({bool isExtraPlay = false}) async {
    if (!isExtraPlay) {
      sacffoldBgColor();
    }
    if (isRolling.value) return;
    makeSound();
    isRolling.value = true;
    animationController.repeat();

    await Future.delayed(const Duration(milliseconds: 700));
    List<int> diceRolls = List.generate(6, (_) => _random.nextInt(6) + 1);
    dice.assignAll(diceRolls);
    histroyList.add(HistoryModel(
        darkColors[bgColorNumber], number_of_dices.value, diceRolls));
    animationController.stop();
    animationController.reset();
    isRolling.value = false;
  }

  void onChangeColorPress() {
    changeColor.value = !changeColor.value;
    sacffoldBgColor();
  }

  void onDarkModePress() {
    isDarkMode.value = !isDarkMode.value;
    sacffoldBgColor();
  }

  void sacffoldBgColor() {
    if (changeColor.value) {
      int i = number_of_players.value - 1;
      (bgColorNumber == i) ? bgColorNumber = 0 : bgColorNumber++;
      ScaffoldBgColor.value = (isDarkMode.value)
          ? darkColors[bgColorNumber]
          : lightColors[bgColorNumber];
    } else {
      ScaffoldBgColor.value = (isDarkMode.value)
          ? const Color.fromARGB(255, 36, 35, 35)
          : const Color.fromARGB(255, 222, 217, 217);
    }
  }

  RxBool isRolling = false.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    sacffoldBgColor();
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  void makeSound() {
    // AudioPlayer().play(AssetSource("assets/audio/diceRollingSound.mp3"));
  }
}
