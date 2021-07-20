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
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.33),
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: InstanceOfGame(
                  oddImageIndex: random.nextInt(6),
                ),
              )),
        )
      ]),
    );
  }
}

class InstanceOfGame extends StatelessWidget {
  final List<List<Image>> imgs = [
    [
      Image.asset('assets/images/fruits/apple.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/fruits/pomegranate.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/fruits/pear.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/fruits/banana.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/birds/bird1.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird2.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird3.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/birds/bird4.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
    ],
    [
      Image.asset('assets/images/herbivores/deer.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/elephant.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/giraffe.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/herbivores/horse.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/drone1.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/drone2.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/drone3.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/helicopter.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/pets/bunny.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/pets/cat.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/pets/dog.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/pets/hamster.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/trucks/truck1.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck2.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck3.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/trucks/truck4.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain)
    ],
    [
      Image.asset('assets/images/wilds/bear.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/wilds/lion.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/wilds/tiger.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain),
      Image.asset('assets/images/wilds/wolf.png',
          // width: 100.0, height: 120.0,
          fit: BoxFit.contain)
    ]
  ];
  final int numberOfCards = 4;
  final int oddImageIndex;
  //final int oddImageSecondIndex;
  InstanceOfGame({Key? key, required this.oddImageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: [
        if (oddImageIndex == 0 || oddImageIndex == 1) ...[
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
                    print("Correct Option tapped.");
                  },
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: imgs[oddImageIndex][oddImageIndex],
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
                          height: MediaQuery.of(context).size.width * 0.35,
                          child: imgs[oddImageIndex + 1][1],
                        )),
                        onTap: () {
                          print("Wrong option tapped.");
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
                print("Wrong Option tapped.");
              },
              child: ClipRect(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.width * 0.35,
                child: imgs[oddImageIndex + 1][2],
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
                      height: MediaQuery.of(context).size.width * 0.35,
                      child: imgs[oddImageIndex + 1][3],
                    )),
                    onTap: () {
                      print("Wrong option tapped.");
                    }))
          ])
        ] else if (oddImageIndex == 2 || oddImageIndex == 3) ...[
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
                    print("Wrong Option tapped.");
                  },
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: imgs[oddImageIndex + 1][1],
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
                          height: MediaQuery.of(context).size.width * 0.35,
                          child: imgs[oddImageIndex][oddImageIndex],
                        )),
                        onTap: () {
                          print("Correct option tapped.");
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
                    print("Wrong Option tapped.");
                  },
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: imgs[oddImageIndex + 1][2],
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
                          height: MediaQuery.of(context).size.width * 0.35,
                          child: imgs[oddImageIndex + 1][3],
                        )),
                        onTap: () {
                          print("Wrong option tapped.");
                        }))
              ])
        ] else if (oddImageIndex == 4 || oddImageIndex == 5) ...[
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
                    print("Wrong Option tapped.");
                  },
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: imgs[oddImageIndex + 1][1],
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
                          height: MediaQuery.of(context).size.width * 0.35,
                          child: imgs[oddImageIndex + 1][2],
                        )),
                        onTap: () {
                          print("Wrong option tapped.");
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
                    print("Wrong Option tapped.");
                  },
                  child: ClipRect(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: imgs[oddImageIndex + 1][3],
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
                          height: MediaQuery.of(context).size.width * 0.35,
                          child: imgs[oddImageIndex][oddImageIndex - 2],
                        )),
                        onTap: () {
                          print("Correct option tapped.");
                        }))
              ])
        ]
      ])),
    );
  }
}
