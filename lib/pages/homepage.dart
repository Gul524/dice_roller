import 'package:dice/configs/colors.dart';
import 'package:dice/pages/dices.dart';
import 'package:dice/pages/homeController.dart';
import 'package:dice/pages/history.dart';
import 'package:dice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  Homecontroller controller = Get.put(Homecontroller());
  @override
  void initState() {
    super.initState();
    controller = Get.put(Homecontroller());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.ScaffoldBgColor.value,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kcPrimaryColor,
          foregroundColor:
              controller.isDarkMode.value ? kcDarkTextColor : kcLightTextColor,
          title: const Text('Dice Roller',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
                onPressed: controller.onChangeColorPress,
                icon: Icon(controller.changeColor.value
                    ? Icons.invert_colors_off
                    : Icons.invert_colors)),
            IconButton(
                onPressed: controller.onDarkModePress,
                icon: Icon(controller.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text(
                          "Players: ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: controller.isDarkMode.value
                                  ? kcDarkTextColor
                                  : kcLightTextColor),
                        ),
                      ),
                      Row(
                          children: List.generate(4, (index) {
                        return PlayerWidget(
                          widgetNumber: index + 1,
                          playerNumber: controller.number_of_players,
                          onpress: () {
                            controller.number_of_players.value = index + 1;
                          },
                        );
                      })),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 110,
                        child: Text(
                          "Dices: ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: controller.isDarkMode.value
                                  ? kcDarkTextColor
                                  : kcLightTextColor),
                        ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(6, (index) {
                                return PlayerWidget(
                                  widgetNumber: index + 1,
                                  playerNumber: controller.number_of_dices,
                                  onpress: () {
                                    controller.number_of_dices.value =
                                        index + 1;
                                  },
                                );
                              }))),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.number_of_dices.value,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Center(
                        child: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0)
                              .animate(controller.animationController),
                          child: DiceWidget(diceNumber: controller.dice[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.onMainPress(isExtraPlay: true);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(kcPrimaryColor),
                        foregroundColor:
                            WidgetStatePropertyAll(kcDarkTextColor),
                      ),
                      child: Text("Extra Play")),
                  mainButton(onpress: () {
                    controller.onMainPress();
                  }),
                  historyButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class historyButton extends StatelessWidget {
  const historyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Card(
        color: Colors.white,
        shape: CircleBorder(
          eccentricity: .5,
          side: BorderSide(
            color: kcPrimaryColor,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: IconButton(
                onPressed: () {
                  Get.to(() => HistoryPage());
                },
                icon: Icon(
                  Icons.history,
                  size: 80,
                  color: kcPrimaryColor,
                )),
          ),
        ),
      ),
    );
  }
}

class mainButton extends StatelessWidget {
  final VoidCallback onpress;
  const mainButton({
    super.key,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Card(
        color: Colors.white,
        shape: CircleBorder(
          eccentricity: .5,
          side: BorderSide(
            color: kcPrimaryColor,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: IconButton(
                onPressed: () {
                  onpress();
                },
                icon: Icon(
                  Icons.play_circle_outline_rounded,
                  size: 80,
                  color: kcPrimaryColor,
                )),
          ),
        ),
      ),
    );
  }
}
