import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  final int diceNumber;
  const DiceWidget({
    super.key,
    required this.diceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (diceNumber == 1)
            Icon(
              Icons.circle,
              size: 15,
            ),
          if (diceNumber == 2)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.circle,
                size: 15,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.circle,
                size: 15,
              )
            ]),
          if (diceNumber == 3)
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ]),
              ],
            ),
          if (diceNumber == 4)
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
              ],
            ),
          if (diceNumber == 5)
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 15,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
              ],
            ),
          if (diceNumber == 6)
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                  )
                ]),
              ],
            ),
        ],
      ),
    );
  }
}
