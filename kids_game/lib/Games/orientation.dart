import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_game/Games/games_background.dart';

class ProperOrientation extends StatefulWidget {
  const ProperOrientation({Key? key}) : super(key: key);

  @override
  _ProperOrientationState createState() => _ProperOrientationState();
}

class _ProperOrientationState extends State<ProperOrientation> {
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
          margin: const EdgeInsets.only(top: 30.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Flawless",
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
                  correctIndex: random.nextInt(10),
                  changeScreen: refreshScreen,
                ),
              )),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatefulWidget {
  final int correctIndex;
  final Function() changeScreen;
  const InstanceOfGame(
      {Key? key, required this.correctIndex, required this.changeScreen})
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

  final List<Image> imgs = [
    Image.asset('assets/images/herbivores/deer.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/elephant.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/giraffe.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/horse.png', fit: BoxFit.contain),
    Image.asset('assets/images/drone1.png', fit: BoxFit.contain),
    Image.asset('assets/images/drone2.png', fit: BoxFit.contain),
    Image.asset('assets/images/drone3.png', fit: BoxFit.contain),
    Image.asset('assets/images/helicopter.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/bunny.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/cat.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/dog.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/hamster.png', fit: BoxFit.contain),
    Image.asset('assets/images/trucks/truck1.png', fit: BoxFit.contain),
    Image.asset('assets/images/trucks/truck2.png', fit: BoxFit.contain),
    Image.asset('assets/images/trucks/truck3.png', fit: BoxFit.contain),
    Image.asset('assets/images/trucks/truck4.png', fit: BoxFit.contain)
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
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
                  for (var i = 0; i < 4; i += 3)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height /
                                  (4 * 1.9),
                              width: MediaQuery.of(context).size.height / (4),
                              margin: EdgeInsets.only(top: i.toDouble()),
                              child: imgs[4],
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
                  for (var i = 0; i < 4; i += 3)
                    if ((widget.correctIndex + i) % 4 == 0) ...[
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Transform.rotate(
                              angle: 3.147 / 2,
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (4 * 1.9),
                                width: MediaQuery.of(context).size.height / (4),
                                margin: EdgeInsets.only(top: i.toDouble()),
                                child: imgs[widget.correctIndex],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                ],
              ),
            )
          ]),
    );
  }
}
