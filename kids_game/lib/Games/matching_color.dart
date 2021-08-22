import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';
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
          margin: EdgeInsets.only(top: 30.0, left: 20.0),
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
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void celebrate() {
    player.setAsset('assets/audios/excellent.mp3');
    player.play();
  }

  void retry() {
    player.setAsset('assets/audios/tryagain.mp3');
    player.play();
  }

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
    // int x = 0;
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          if (widget.oddImageIndex % 2 == 0) ...[
            if (widget.oddImageIndex % 4 == 0) ...[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                      onTap: () {
                        celebrate();
                        Timer(const Duration(seconds: 2), () {
                          refreshCountingScreen();
                        });
                      },
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[(widget.oddImageIndex)],
                          textOnBox: colorName[(widget.oddImageIndex)],
                        ),
                      ),
                    )),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 1) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 2) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Material(
                          child: InkWell(
                        onTap: () {
                          retry();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor:
                                colorOfCards[(widget.oddImageIndex + 3) % 10],
                            textOnBox:
                                colorName[(widget.oddImageIndex + 4) % 10],
                          ),
                        ),
                      )),
                    )
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 2) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 1) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 4) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 5) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            }))
                  ])
            ] else ...[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                      onTap: () {
                        retry();
                      },
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor:
                              colorOfCards[(widget.oddImageIndex + 1) % 10],
                          textOnBox: colorName[(widget.oddImageIndex + 2) % 10],
                        ),
                      ),
                    )),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[(widget.oddImageIndex)],
                                textOnBox: colorName[(widget.oddImageIndex)],
                              ),
                            ),
                            onTap: () {
                              celebrate();
                              Timer(const Duration(seconds: 2), () {
                                refreshCountingScreen();
                              });
                            })),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Material(
                          child: InkWell(
                        onTap: () {
                          retry();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor:
                                colorOfCards[(widget.oddImageIndex + 3) % 10],
                            textOnBox:
                                colorName[(widget.oddImageIndex + 4) % 10],
                          ),
                        ),
                      )),
                    )
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 2) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 1) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 4) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 5) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            }))
                  ])
            ]
          ] else if (widget.oddImageIndex % 3 == 0) ...[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Material(
                      child: InkWell(
                    onTap: () {
                      retry();
                    },
                    child: ClipRect(
                      child: ColoredCards(
                        boxColor: colorOfCards[(widget.oddImageIndex + 1) % 10],
                        textOnBox: colorName[(widget.oddImageIndex + 2) % 10],
                      ),
                    ),
                  )),
                  Material(
                      child: InkWell(
                          child: ClipRect(
                            child: ColoredCards(
                              boxColor:
                                  colorOfCards[(widget.oddImageIndex + 3) % 10],
                              textOnBox:
                                  colorName[(widget.oddImageIndex + 4) % 10],
                            ),
                          ),
                          onTap: () {
                            retry();
                          })),
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Center(
                    child: Material(
                        child: InkWell(
                      onTap: () {
                        celebrate();
                        Timer(const Duration(seconds: 2), () {
                          refreshCountingScreen();
                        });
                      },
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor: colorOfCards[(widget.oddImageIndex)],
                          textOnBox: colorName[(widget.oddImageIndex)],
                        ),
                      ),
                    )),
                  )
                ]),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Material(
                      child: InkWell(
                          child: ClipRect(
                            child: ColoredCards(
                              boxColor:
                                  colorOfCards[(widget.oddImageIndex + 2) % 10],
                              textOnBox:
                                  colorName[(widget.oddImageIndex + 1) % 10],
                            ),
                          ),
                          onTap: () {
                            retry();
                          })),
                  Material(
                      child: InkWell(
                          child: ClipRect(
                            child: ColoredCards(
                              boxColor:
                                  colorOfCards[(widget.oddImageIndex + 4) % 10],
                              textOnBox:
                                  colorName[(widget.oddImageIndex + 5) % 10],
                            ),
                          ),
                          onTap: () {
                            retry();
                          }))
                ])
          ] else ...[
            if (widget.oddImageIndex % 5 == 0) ...[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                      onTap: () {
                        retry();
                      },
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor:
                              colorOfCards[(widget.oddImageIndex + 1) % 10],
                          textOnBox: colorName[(widget.oddImageIndex + 2) % 10],
                        ),
                      ),
                    )),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 3) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 4) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Material(
                          child: InkWell(
                        onTap: () {
                          retry();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor:
                                colorOfCards[(widget.oddImageIndex + 2) % 10],
                            textOnBox:
                                colorName[(widget.oddImageIndex + 1) % 10],
                          ),
                        ),
                      )),
                    )
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[(widget.oddImageIndex)],
                                textOnBox: colorName[(widget.oddImageIndex)],
                              ),
                            ),
                            onTap: () {
                              celebrate();
                              Timer(const Duration(seconds: 2), () {
                                refreshCountingScreen();
                              });
                            })),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 4) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 5) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            }))
                  ])
            ] else ...[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                      onTap: () {
                        retry();
                      },
                      child: ClipRect(
                        child: ColoredCards(
                          boxColor:
                              colorOfCards[(widget.oddImageIndex + 1) % 10],
                          textOnBox: colorName[(widget.oddImageIndex + 2) % 10],
                        ),
                      ),
                    )),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 3) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 4) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Material(
                          child: InkWell(
                        onTap: () {
                          retry();
                        },
                        child: ClipRect(
                          child: ColoredCards(
                            boxColor:
                                colorOfCards[(widget.oddImageIndex + 2) % 10],
                            textOnBox:
                                colorName[(widget.oddImageIndex + 1) % 10],
                          ),
                        ),
                      )),
                    )
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[
                                    (widget.oddImageIndex + 4) % 10],
                                textOnBox:
                                    colorName[(widget.oddImageIndex + 5) % 10],
                              ),
                            ),
                            onTap: () {
                              retry();
                            })),
                    Material(
                        child: InkWell(
                            child: ClipRect(
                              child: ColoredCards(
                                boxColor: colorOfCards[(widget.oddImageIndex)],
                                textOnBox: colorName[(widget.oddImageIndex)],
                              ),
                            ),
                            onTap: () {
                              celebrate();
                              Timer(const Duration(seconds: 2), () {
                                refreshCountingScreen();
                              });
                            }))
                  ])
            ]
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
