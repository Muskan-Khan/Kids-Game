import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_game/Games/games_background.dart';

class OddOneOut extends StatefulWidget {
  const OddOneOut({Key? key}) : super(key: key);

  @override
  _OddOneOutState createState() => _OddOneOutState();
}

class _OddOneOutState extends State<OddOneOut> {
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
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: InstanceOfGame(
              oddImageIndex: random.nextInt(4),
            ),
          ),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatelessWidget {
  final List<List<Image>> imgs = [
    [
      Image.asset('assets/images/apple.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/pomegranate.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/pear.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/kinnows.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/bird.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/lion.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/catonchair.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/cat.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/blackGrapes.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/grapes.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/rasberry.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/cane.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/drone1.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/drone2.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/drone3.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain),
      Image.asset('assets/images/helicopter.png',
          width: 100.0, height: 120.0, fit: BoxFit.contain)
    ]
  ];
  final int numberOfCards = 4;
  final int oddImageIndex;
  InstanceOfGame({Key? key, required this.oddImageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(children: [
        if (oddImageIndex == 0) ...[
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Material(
                    child: InkWell(
                        onTap: () {
                          print('Tapped');
                        },
                        child: ClipRect(
                          child: imgs[oddImageIndex][oddImageIndex],
                        ))),

                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),
                imgs[oddImageIndex + 1][oddImageIndex + 1],
              ]),
          Container(
            height: 20.0,
            width: 400,
          ),
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex + 1][oddImageIndex + 2],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),

                imgs[oddImageIndex + 1][oddImageIndex + 3],
              ])
        ] else if (oddImageIndex == 1) ...[
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 1][oddImageIndex - 1],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),
                imgs[oddImageIndex][oddImageIndex],
              ]),
          Container(
            height: 20.0,
            width: 400,
          ),
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 1][oddImageIndex + 1],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),

                imgs[oddImageIndex - 1][oddImageIndex + 2],
              ])
        ] else if (oddImageIndex == 2) ...[
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 2][oddImageIndex - 2],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),
                imgs[oddImageIndex][oddImageIndex],
              ]),
          Container(
            height: 20.0,
            width: 400,
          ),
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 2][oddImageIndex - 1],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),

                imgs[oddImageIndex - 2][oddImageIndex + 1],
              ])
        ] else if (oddImageIndex == 3) ...[
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 3][oddImageIndex - 3],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),
                imgs[oddImageIndex - 3][oddImageIndex - 2],
              ]),
          Container(
            height: 20.0,
            width: 400,
          ),
          Row(
              //mainAxisSize: MainAxisSize.,
              // verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imgs[oddImageIndex - 3][oddImageIndex - 1],
                //if()
                Container(
                  height: 120.0,
                  width: 20,
                ),

                imgs[oddImageIndex][oddImageIndex],
              ])
        ]
      ]),
    ));
  }
}
