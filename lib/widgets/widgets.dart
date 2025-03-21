import 'package:dice/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerWidget extends StatelessWidget {
  final int widgetNumber;
  final RxInt playerNumber;
  final VoidCallback onpress;
  const PlayerWidget(
      {super.key,
      required this.widgetNumber,
      required this.playerNumber,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: InkWell(
        onTap: onpress,
        child: Obx(
          ()=> Card(
            color: (playerNumber.value == widgetNumber)
                ? kcPrimaryColor
                : kcSecondaryColor,
            shape: CircleBorder(
                eccentricity: .5,
                side: BorderSide(width: 1, color: kcPrimaryColor)),
            child: Center(
                child: Text(
              widgetNumber.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
