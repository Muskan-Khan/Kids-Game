import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';
import 'package:kids_game/Games/games_background.dart';

class OddOneOut extends StatefulWidget {
  const OddOneOut({Key? key}) : super(key: key);

  @override
  _OddOneOutState createState() => _OddOneOutState();
}

class _OddOneOutState extends State<OddOneOut> {
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
      // print('help me in creating Instance');
    });
  }

  final List<List<Image>> imgs = [
    [
      Image.asset('assets/images/fruits/apple.png', fit: BoxFit.contain),
      Image.asset('assets/images/fruits/pomegranate.png', fit: BoxFit.contain),
      Image.asset('assets/images/fruits/pear.png', fit: BoxFit.contain),
      Image.asset('assets/images/fruits/banana.png', fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/birds/bird1.png', fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird2.png', fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird3.png', fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird4.png', fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/herbivores/deer.png', fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/elephant.png', fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/giraffe.png', fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/horse.png', fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/drone1.png', fit: BoxFit.contain),
      Image.asset('assets/images/drone2.png', fit: BoxFit.contain),
      Image.asset('assets/images/drone3.png', fit: BoxFit.contain),
      Image.asset('assets/images/helicopter.png', fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/pets/bunny.png', fit: BoxFit.contain),
      Image.asset('assets/images/pets/cat.png', fit: BoxFit.contain),
      Image.asset('assets/images/pets/dog.png', fit: BoxFit.contain),
      Image.asset('assets/images/pets/hamster.png', fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/trucks/truck1.png', fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck2.png', fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck3.png', fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck4.png', fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/wilds/bear.png', fit: BoxFit.contain),
      Image.asset('assets/images/wilds/lion.png', fit: BoxFit.contain),
      Image.asset('assets/images/wilds/tiger.png', fit: BoxFit.contain),
      Image.asset('assets/images/wilds/wolf.png', fit: BoxFit.contain)
    ]
  ];

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
                  celebrate();
                  Timer(const Duration(seconds: 2), () {
                    refreshCountingScreen();
                  });
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex][widget.oddImageIndex],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex + 1][1],
                      )),
                      onTap: () {
                        retry();
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
              retry();
            },
            child: ClipRect(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              height: MediaQuery.of(context).size.width * 0.35,
              child: imgs[widget.oddImageIndex + 1][2],
            )),
          )),

          //if()
          Container(
            height: 120.0,
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Material(
              child: InkWell(
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.45,
                    child: imgs[widget.oddImageIndex + 1][3],
                  )),
                  onTap: () {
                    retry();
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
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][1],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex][widget.oddImageIndex],
                      )),
                      onTap: () {
                        celebrate();
                        Timer(const Duration(seconds: 2), () {
                          refreshCountingScreen();
                        });
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
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][2],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex + 1][3],
                      )),
                      onTap: () {
                        retry();
                      }))
            ])
      ] else if (widget.oddImageIndex == 4) ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][1],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex + 1][2],
                      )),
                      onTap: () {
                        retry();
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
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][3],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex]
                            [widget.oddImageIndex - 2],
                      )),
                      onTap: () {
                        celebrate();
                        Timer(const Duration(seconds: 2), () {
                          refreshCountingScreen();
                        });
                      }))
            ])
      ] else ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][1],
                )),
              )),

              //if()
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex + 1][2],
                      )),
                      onTap: () {
                        retry();
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
                      child: ClipRect(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.width * 0.45,
                        child: imgs[widget.oddImageIndex]
                            [widget.oddImageIndex - 2],
                      )),
                      onTap: () {
                        celebrate();
                        Timer(const Duration(seconds: 2), () {
                          refreshCountingScreen();
                        });
                      })),
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),

              Material(
                  child: InkWell(
                onTap: () {
                  retry();
                },
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.oddImageIndex + 1][3],
                )),
              )),

              //if()
            ])
      ]
    ]));
  }
}
