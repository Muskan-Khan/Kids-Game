import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kids_game/Games/games_background.dart';

class Phonics extends StatefulWidget {
  const Phonics({Key? key}) : super(key: key);
  @override
  _PhonicsState createState() => _PhonicsState();
}

class _PhonicsState extends State<Phonics> {
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
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
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.16),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: InstanceOfGame(
            alphabetIndex: 0,
          )),
        )),
      ],
    ));
  }
}

class InstanceOfGame extends StatefulWidget {
  final int alphabetIndex;
  const InstanceOfGame({Key? key, required this.alphabetIndex})
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

  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(children: [
      if (widget.alphabetIndex >= 1 && widget.alphabetIndex <= 6) ...[
        Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                  child: InkWell(
                onTap: () {},
                child: ClipRect(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: imgs[widget.alphabetIndex],
                )),
              )),
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
                        child: imgs[widget.alphabetIndex + 1],
                      )),
                      onTap: () {}))
            ]),
        Container(
          height: 20.0,
          width: 400,
        ),
        Row(children: <Widget>[
          Material(
              child: InkWell(
            onTap: () {},
            child: ClipRect(
                child: Container(
              width: MediaQuery.of(context).size.width * 0.38,
              height: MediaQuery.of(context).size.width * 0.35,
              child: imgs[widget.alphabetIndex + 2],
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
              child: imgs[widget.alphabetIndex],
            )),
            onTap: () {},
          ))
        ])
      ]
    ])));
  }
}
