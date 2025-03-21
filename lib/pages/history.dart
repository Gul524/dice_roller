import 'package:dice/configs/colors.dart';
import 'package:dice/logic/logic.dart';
import 'package:dice/pages/dices.dart';
import 'package:dice/pages/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Homecontroller>();
    final list = histroyList.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
        foregroundColor:
            controller.isDarkMode.value ? kcDarkTextColor : kcLightTextColor,
        title: const Text('Dice Roller',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: (histroyList.isNotEmpty)
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: list[index].color,
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(list[index].diceNumber, (i) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                list[index].list[i].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: controller.isDarkMode.value
                                      ? kcDarkTextColor
                                      : kcLightTextColor,
                                ),
                              ),
                            ),
                          );
                        }),
                      )),
                );
              })
          : Center(
              child: Text(
                "No Record Found",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
    );
  }
}
