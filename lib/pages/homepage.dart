import 'package:dice/configs/colors.dart';
import 'package:dice/data/Data.dart';
import 'package:dice/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

int colorNo = 0;

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (colorChange)
          ? (kcDarkMode)
              ? darkColorList[colorNo]
              : lightColorList[colorNo]
          : kcBgColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
        title: Text('Dice Roller',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          ColorChangeButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Players: ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kcTextColor),
                ),
                PlayersSelectionRow(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 50,
          ),
          mainButton(),
          historyButton()
        ],
      ),
    );
  }
}

class ColorChangeButton extends StatefulWidget {
  const ColorChangeButton({
    super.key,
  });

  @override
  State<ColorChangeButton> createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          colorChange = !colorChange;
          setState(() {
          });
        },
        icon: Icon((colorChange)
            ? Icons.invert_colors
            : Icons.invert_colors_off));
  }
}

class PlayersSelectionRow extends StatefulWidget {
  const PlayersSelectionRow({
    super.key,
  });

  @override
  State<PlayersSelectionRow> createState() => _PlayersSelectionRowState();
}

class _PlayersSelectionRowState extends State<PlayersSelectionRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        PlayerWidget(
          widgetNumber: 1,
          playerNumber: number_of_player,
          onpress: () {
            setState(() {});
          },
        ),
        PlayerWidget(
          widgetNumber: 2,
          playerNumber: number_of_player,
          onpress: () {
            setState(() {});
          },
        ),
        PlayerWidget(
          widgetNumber: 3,
          playerNumber: number_of_player,
          onpress: () {
            setState(() {});
          },
        ),
        PlayerWidget(
          widgetNumber: 4,
          playerNumber: number_of_player,
          onpress: () {
            setState(() {});
          },
        ),
      ]),
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
                onPressed: () {},
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
  const mainButton({
    super.key,
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
                onPressed: () {},
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
