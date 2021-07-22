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
              "Odd One Out",
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
                  top: MediaQuery.of(context).size.height * 0.16),
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: InstanceOfGame(
                  oddImageIndex: random.nextInt(6),
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
    "Maroon",
    "Gray",
    "Orange"
  ];
  final List<Color> colorOfCards = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.pink,
    Colors.redAccent,
    Colors.blueGrey,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      if (widget.oddImageIndex == 0 || widget.oddImageIndex == 1) ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  refreshCountingScreen();
                },
                child: ClipRect(
                  child: ColoredCards(
                    boxColor: colorOfCards[0],
                    textOnBox: colorName[0],
                  ),
                ),
              )),
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[0],
                          textOnBox: colorName[0],
                        ),
                      ),
                      onTap: () {
                        refreshCountingScreen();
                      }))
            ]),
        Container(
          height: 20.0,
          width: 400,
        ),
        Row(children: <Widget>[
          Material(
              child: InkWell(
            onTap: () {
              refreshCountingScreen();
            },
            child: ClipRect(
              child: ColoredCards(
                boxColor: colorOfCards[0],
                textOnBox: colorName[0],
              ),
            ),
          )),
          Container(
            height: 120.0,
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Material(
              child: InkWell(
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[0],
                      textOnBox: colorName[0],
                    ),
                  ),
                  onTap: () {
                    refreshCountingScreen();
                  }))
        ])
      ] else if (widget.oddImageIndex == 2 || widget.oddImageIndex == 3) ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  refreshCountingScreen();
                },
                child: ClipRect(
                  child: ColoredCards(
                    boxColor: colorOfCards[0],
                    textOnBox: colorName[0],
                  ),
                ),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[0],
                          textOnBox: colorName[0],
                        ),
                      ),
                      onTap: () {
                        refreshCountingScreen();
                      }))
            ]),
        Container(
          height: 20.0,
          width: 400,
        ),
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  refreshCountingScreen();
                },
                child: ClipRect(
                  child: ColoredCards(
                    boxColor: colorOfCards[0],
                    textOnBox: colorName[0],
                  ),
                ),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[0],
                          textOnBox: colorName[0],
                        ),
                      ),
                      onTap: () {
                        refreshCountingScreen();
                      }))
            ])
      ] else if (widget.oddImageIndex == 4 || widget.oddImageIndex == 5) ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  refreshCountingScreen();
                },
                child: ClipRect(
                  child: ColoredCards(
                    boxColor: colorOfCards[0],
                    textOnBox: colorName[0],
                  ),
                ),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[0],
                          textOnBox: colorName[0],
                        ),
                      ),
                      onTap: () {
                        refreshCountingScreen();
                      }))
            ]),
        Container(
          height: 20.0,
          width: 400,
        ),
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  refreshCountingScreen();
                },
                child: ClipRect(
                  child: ColoredCards(
                    boxColor: colorOfCards[0],
                    textOnBox: colorName[0],
                  ),
                ),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[0],
                          textOnBox: colorName[0],
                        ),
                      ),
                      onTap: () {
                        refreshCountingScreen();
                      }))
            ])
      ]
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
          child: SizedBox(
              width: screenWidth / 2.8,
              height: screenHeight / 5.9,
              child: Center(
                  child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.textOnBox,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OtomanopeeOne-Regular',
                    fontSize: screenWidth / 20,
                    color: widget.boxColor,
                  ),
                ),
              ))),
        ),
      ),
    );
  }
}
