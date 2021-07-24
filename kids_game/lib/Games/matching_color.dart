import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_game/Games/games_background.dart';

class MatchingColors extends StatefulWidget {
  const MatchingColors({Key? key}) : super(key: key);

  @override
  _MatchingColorsState createState() => _MatchingColorsState();
}

class _MatchingColorsState extends State<MatchingColors> {
  void refreshScreen() {
    setState(() {});
  }

  var random = Random();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        GameBackground(),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Colours",
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 50,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: InstanceOfGame(
                  oddImageIndex: random.nextInt(10),
                  changeScreen: refreshScreen,
                ),
              )),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatefulWidget {
  final int oddImageIndex;
  final Function() changeScreen;
  const InstanceOfGame(
      {Key? key, required this.oddImageIndex, required this.changeScreen})
      : super(key: key);

  @override
  _InstanceOfGameState createState() => _InstanceOfGameState();
}

class _InstanceOfGameState extends State<InstanceOfGame> {
  void refreshCountingScreen() {
    setState(() {
      widget.changeScreen();
    });
  }

  final List<String> colorName = [
    "Red",
    "Black",
    "Green",
    "Blue",
    "Yellow",
    "Purple",
    "Pink",
    "Gray",
    "Orange",
    "Brown"
  ];
  final List<Color> colorOfCards = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.pink,
    Colors.blueGrey,
    Colors.orange,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    int x = 0;
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          for (int i = 0; i < 3; i++) ...[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  if (i == 1) ...[
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor:
                                    colorOfCards[widget.oddImageIndex % 10],
                                textOnBox: colorName[
                                    (widget.oddImageIndex + x++) % 10],
                              ),
                            ),
                            onTap: () {
                              refreshCountingScreen();
                            }))
                  ] else ...[
                    if (widget.oddImageIndex % 3 == 0) ...[
                      Material(
                          child: InkWell(
                        onTap: () {
                          refreshCountingScreen();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[
                                (widget.oddImageIndex + i + 1) % 10],
                            textOnBox: colorName[
                                (widget.oddImageIndex + i + 1 + x++) % 10],
                          ),
                        ),
                      )),
                      Material(
                          child: InkWell(
                              child: ClipRect(
                                child: ColoredCards(
                                  boxColor: colorOfCards[
                                      (widget.oddImageIndex + i + 2) % 10],
                                  textOnBox: colorName[
                                      (widget.oddImageIndex + i + 2 + x++) %
                                          10],
                                ),
                              ),
                              onTap: () {
                                refreshCountingScreen();
                              }))
                    ] else ...[
                      Material(
                          child: InkWell(
                              child: ClipRect(
                                child: ColoredCards(
                                  boxColor: colorOfCards[
                                      (widget.oddImageIndex + i + 2) % 10],
                                  textOnBox: colorName[
                                      (widget.oddImageIndex + i + 2 + x++) %
                                          10],
                                ),
                              ),
                              onTap: () {
                                refreshCountingScreen();
                              })),
                      Material(
                          child: InkWell(
                        onTap: () {
                          refreshCountingScreen();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[
                                (widget.oddImageIndex + i + 1) % 10],
                            textOnBox: colorName[
                                (widget.oddImageIndex + i + 1 + x++) % 10],
                          ),
                        ),
                      )),
                    ]
                  ]
                ]),
          ],
        ]));
  }
}

class ColoredCards extends StatefulWidget {
  final Color boxColor;
  final String textOnBox;
  const ColoredCards(
      {Key? key, required this.boxColor, required this.textOnBox})
      : super(key: key);

  @override
  _ColoredCardsState createState() => _ColoredCardsState();
}

class _ColoredCardsState extends State<ColoredCards> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Card(
          color: widget.boxColor,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: SizedBox(
              width: screenWidth / 3.2,
              height: screenHeight / 6.4,
              child: Center(
                  child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.textOnBox,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OtomanopeeOne-Regular',
                    fontSize: screenWidth / 13,
                    color: Colors.white,
                  ),
                ),
              ))),
        ),
      ),
    );
  }
}
