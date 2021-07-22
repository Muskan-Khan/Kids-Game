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
    "Orange",
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
    Colors.orange,
    Colors.redAccent,
    Colors.blueGrey,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    // print(widget.oddImageIndex);
    int x = 0;
    int i = 1;
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // for (int i = 0; i < 5; i++) ...[
        if (widget.oddImageIndex <= 3) ...[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 4],
                      textOnBox: colorName[i + 5 + x],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i],
                            textOnBox: colorName[i + x++],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 1],
                      textOnBox: colorName[i + 1 + x],
                    ),
                  ),
                )),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 2],
                      textOnBox: colorName[i + 2 + x],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i + 3],
                            textOnBox: colorName[i + 3 + x],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ])
        ] else if (widget.oddImageIndex > 3 && (widget.oddImageIndex <= 7)) ...[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i],
                      textOnBox: colorName[i + x + 1],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i + 1],
                            textOnBox: colorName[i + x++],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 2],
                      textOnBox: colorName[i + 2 + x],
                    ),
                  ),
                )),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 3],
                      textOnBox: colorName[i + 3 + x],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i + 4],
                            textOnBox: colorName[i + 4 + x],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ])
        ] else if (widget.oddImageIndex > 7) ...[
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 2],
                      textOnBox: colorName[i + 2 + x + 1],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i + 3],
                            textOnBox: colorName[i + 3 + x],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i + 1],
                      textOnBox: colorName[i + 1 + x++],
                    ),
                  ),
                )),
              ]),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                    child: InkWell(
                  onTap: () {
                    refreshCountingScreen();
                  },
                  child: ClipRect(
                    child: ColoredCards(
                      boxColor: colorOfCards[i],
                      textOnBox: colorName[i + x],
                    ),
                  ),
                )),
                Material(
                    child: InkWell(
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor: colorOfCards[i + 4],
                            textOnBox: colorName[i + 4 + x],
                          ),
                        ),
                        onTap: () {
                          refreshCountingScreen();
                        }))
              ])
        ]
      ],
      // ]
    ));
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: SizedBox(
              width: screenWidth / 3.2,
              height: screenHeight / 6.2,
              child: Center(
                  child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.textOnBox,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OtomanopeeOne-Regular',
                    fontSize: screenWidth / 10,
                  ),
                ),
              ))),
        ),
      ),
    );
  }
}
