import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';
import 'package:kids_game/Games/games_background.dart';

class Phonics extends StatefulWidget {
  const Phonics({Key? key}) : super(key: key);
  @override
  _PhonicsState createState() => _PhonicsState();
}

class _PhonicsState extends State<Phonics> {
  void refreshOptions() {
    setState(() {});
  }

  var random = Random();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        GameBackground(),
        Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0),
          child: const Material(
            type: MaterialType.transparency,
            child: Text(
              "Phonics",
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
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: InstanceOfGame(
            alphabetIndex: random.nextInt(5),
            changeOptions: refreshOptions,
          )),
        )),
      ],
    ));
  }
}

class InstanceOfGame extends StatefulWidget {
  final int alphabetIndex;
  final Function() changeOptions;
  const InstanceOfGame(
      {Key? key, required this.alphabetIndex, required this.changeOptions})
      : super(key: key);
  @override
  _InstanceOfGameState createState() => _InstanceOfGameState();
}

class _InstanceOfGameState extends State<InstanceOfGame> {
  final List alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
  ];
  final List<Image> imgs = [
    Image.asset('assets/images/fruits/apple.png', fit: BoxFit.contain),
    Image.asset('assets/images/fruits/banana.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/cat.png', fit: BoxFit.contain),
    Image.asset('assets/images/pets/dog.png', fit: BoxFit.contain),
    Image.asset('assets/images/herbivores/elephant.png', fit: BoxFit.contain),
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

  void refreshCountingScreen() {
    setState(() {
      widget.changeOptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      if (widget.alphabetIndex >= 0 && widget.alphabetIndex <= 6) ...[
        Center(
          child: Text(
            alphabets[widget.alphabetIndex],
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
                decoration: TextDecoration.none),
          ),
        ),
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
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: imgs[widget.alphabetIndex],
                )),
              )),
              SizedBox(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                      child: ClipRect(
                          child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: imgs[(widget.alphabetIndex + 1) % 5],
                      )),
                      onTap: () {
                        retry();
                      }))
            ]),
        const SizedBox(
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
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: imgs[(widget.alphabetIndex + 3) % 5],
                )),
              )),
              SizedBox(
                height: 120.0,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Material(
                  child: InkWell(
                child: ClipRect(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: imgs[(widget.alphabetIndex + 4) % 5],
                )),
                onTap: () {
                  retry();
                },
              ))
            ])
      ]
    ]));
  }
}
