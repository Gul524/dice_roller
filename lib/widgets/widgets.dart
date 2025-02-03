import 'package:dice/configs/colors.dart';
import 'package:dice/data/Data.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  final int widgetNumber;
  final int playerNumber;
  final VoidCallback onpress;
  const PlayerWidget(
      {super.key, required this.widgetNumber, required this.playerNumber, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: InkWell(
        onTap: () {
          number_of_player = widgetNumber;
          onpress();
        },
        child: Card(
          color: (playerNumber == widgetNumber)
              ? kcPrimaryColor
              : kcSecondaryColor,
          shape: CircleBorder(
              eccentricity: .5,
              side: BorderSide(width: 1, color: kcPrimaryColor)),
          child: Center(
              child: Text(
            widgetNumber.toString(),
            style: TextStyle(
              fontSize: 25,
              color: (playerNumber == widgetNumber)
                  ? Colors.white
                  : Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
