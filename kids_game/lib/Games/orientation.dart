import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';
import 'package:kids_game/Games/games_background.dart';

class ProperOrientation extends StatefulWidget {
  const ProperOrientation({Key? key}) : super(key: key);

  @override
  _ProperOrientationState createState() => _ProperOrientationState();
}

class _ProperOrientationState extends State<ProperOrientation> {
  void refreshOptions() {
    setState(() {});
  }

  var random = Random();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        const GameBackground(),
        Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Erect",
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
                  correctIndex: random.nextInt(12),
                  changeOptions: refreshOptions,
                ),
              )),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatefulWidget {
  final int correctIndex;
  final Function() changeOptions;
  const InstanceOfGame(
      {Key? key, required this.correctIndex, required this.changeOptions})
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
      widget.changeOptions();
    });
  }

  final List<Image> imgs = [
    Image.asset('assets/images/herbivores/deer.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/elephant.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/giraffe.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/horse.png', fit: BoxFit.contain),
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
          if (widget.correctIndex % 2 == 0) ...[
            if (widget.correctIndex % 4 == 0) ...[
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 0.0,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                celebrate();
                                Timer(const Duration(seconds: 2), () {
                                  refreshCountingScreen();
                                });
                              }),
                        )),
                    Transform.rotate(
                        angle: 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        ))
                  ])),
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3.147,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        )),
                    Transform.rotate(
                        angle: 3 * 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        ))
                  ]))
            ] else ...[
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        )),
                    Transform.rotate(
                        angle: 0.0,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                celebrate();
                                Timer(const Duration(seconds: 2), () {
                                  refreshCountingScreen();
                                });
                              }),
                        ))
                  ])),
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3 * 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        )),
                    Transform.rotate(
                        angle: 3.147,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        ))
                  ]))
            ]
          ] else ...[
            if (widget.correctIndex % 3 == 0) ...[
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3 * 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        )),
                    Transform.rotate(
                        angle: 3.147 / 2,
                        child: Material(
                          child: InkWell(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    (5 * 1.9),
                                width: MediaQuery.of(context).size.height / (5),
                                margin: const EdgeInsets.only(top: 1.0),
                                child: imgs[widget.correctIndex],
                              ),
                              onTap: () {
                                retry();
                              }),
                        ))
                  ])),
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3.147,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  retry();
                                }))),
                    Transform.rotate(
                        angle: 0.0,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  celebrate();
                                  Timer(const Duration(seconds: 2), () {
                                    refreshCountingScreen();
                                  });
                                })))
                  ]))
            ] else ...[
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 3.147 / 2,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  retry();
                                }))),
                    Transform.rotate(
                        angle: 3 * 3.147 / 2,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  retry();
                                  Timer(const Duration(seconds: 2), () {
                                    refreshCountingScreen();
                                  });
                                })))
                  ])),
              Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Transform.rotate(
                        angle: 0.0,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  celebrate();
                                  Timer(const Duration(seconds: 2), () {
                                    refreshCountingScreen();
                                  });
                                }))),
                    Transform.rotate(
                        angle: 3.147,
                        child: Material(
                            child: InkWell(
                                child: Container(
                                  height: MediaQuery.of(context).size.height /
                                      (5 * 1.9),
                                  width:
                                      MediaQuery.of(context).size.height / (5),
                                  margin: const EdgeInsets.only(top: 1.0),
                                  child: imgs[widget.correctIndex],
                                ),
                                onTap: () {
                                  retry();
                                })))
                  ])),
            ]
          ]
        ]));
  }
}
