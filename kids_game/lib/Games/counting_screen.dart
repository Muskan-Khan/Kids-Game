import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_game/Games/games_background.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({Key? key}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  var random = Random();
  final min = 1;
  final max = 15;
  void refreshScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return Center(
      child: Stack(children: [
        GameBackground(),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Game Name",
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 50,
              ),
            ),
          ),
        ),
        Center(
            child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: InstanceOfGame(
            numberOfCards: (min + random.nextInt(max - min)),
            changeScreen: refreshScreen,
          ),
        )),
      ]),
    );
  }
}

class InstanceOfGame extends StatefulWidget {
  final Function() changeScreen;
  final int numberOfCards;
  const InstanceOfGame(
      {Key? key, required this.numberOfCards, required this.changeScreen})
      : super(key: key);

  @override
  _InstanceOfGameState createState() => _InstanceOfGameState();
}

class _InstanceOfGameState extends State<InstanceOfGame> {
  final List<Image> imgs = [
    Image.asset('assets/images/apple.png'),
    Image.asset('assets/images/boyOnly.png'),
    Image.asset('assets/images/kinnows.png'),
    Image.asset('assets/images/durian.png'),
    Image.asset('assets/images/car.png'),
    Image.asset('assets/images/bird.png'),
    Image.asset('assets/images/lion.png'),
    Image.asset('assets/images/lemon.png'),
    Image.asset('assets/images/hotAirBaloon.png'),
    Image.asset('assets/images/applewithleaves.png'),
    Image.asset('assets/images/blackGrapes.png'),
    Image.asset('assets/images/cane.png'),
    Image.asset('assets/images/cat.png'),
    Image.asset('assets/images/catonchair.png'),
    Image.asset('assets/images/drone1.png'),
    Image.asset('assets/images/drone2.png'),
    Image.asset('assets/images/drone3.png'),
    Image.asset('assets/images/grapes.png'),
    Image.asset('assets/images/helicopter.png'),
    Image.asset('assets/images/rasberry.png'),
    Image.asset('assets/images/pomegranate.png'),
    Image.asset('assets/images/pear.png')
  ];

  void refreshCountingScreen() {
    setState(() {
      widget.changeScreen();
      // print('help me in creating Instance');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // Row(),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            verticalDirection: VerticalDirection.down,
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(top: i.toDouble()),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 1; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(
                                  left: i.toDouble(),
                                ),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 2; i < widget.numberOfCards; i += 3)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards * 1.9),
                                width: MediaQuery.of(context).size.height /
                                    (widget.numberOfCards),
                                margin: EdgeInsets.only(
                                    left: i.toDouble(), bottom: i.toDouble()),
                                child: ImagesToBeRendered(
                                  img: imgs[widget.numberOfCards],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Options(
          rightAnswer: widget.numberOfCards,
          changeInstance: refreshCountingScreen,
        ),
      ]),
    );
  }
}

class ImagesToBeRendered extends StatelessWidget {
  final Image img;
  const ImagesToBeRendered({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return img;
  }
}

class Options extends StatefulWidget {
  final Function() changeInstance;
  final int rightAnswer;
  const Options(
      {Key? key, required this.rightAnswer, required this.changeInstance})
      : super(key: key);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  void refreshOptions() {
    setState(() {
      widget.changeInstance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: [
          if (widget.rightAnswer % 2 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 1,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
          ] else if (widget.rightAnswer % 3 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 3,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
          ] else if (widget.rightAnswer % 5 == 0) ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 5,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
          ] else ...[
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer + 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer * 2,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
            DisplayOptionCard(
                optionValue: widget.rightAnswer,
                rightAnswer: widget.rightAnswer,
                changeOptions: refreshOptions),
          ]
        ],
      )),
    );
  }
}

class DisplayOptionCard extends StatefulWidget {
  // var random = Random();
  final Function() changeOptions;
  final int optionValue;
  final int rightAnswer;
  const DisplayOptionCard(
      {Key? key,
      required this.optionValue,
      required this.changeOptions,
      required this.rightAnswer})
      : super(key: key);

  @override
  _DisplayOptionCardState createState() => _DisplayOptionCardState();
}

class _DisplayOptionCardState extends State<DisplayOptionCard> {
  @override
  Widget build(BuildContext context) {
    int x = 2;
    return Container(
      child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            child: Card(
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Center(
                    child: Text(
                      (widget.optionValue).toString(),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height / 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              if (widget.optionValue == widget.rightAnswer) {
                widget.changeOptions();
              } else {
                widget.changeOptions();
              }
            },
          )),
    );
  }
}
