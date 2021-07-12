import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_game/HomeScreen/background.dart';
import 'package:kids_game/Games/games_background.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({Key? key}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  var random = Random();
  final min = 2;
  final max = 20;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        GameBackground(),
        const Material(
          type: MaterialType.transparency,
          child: Text(
            "Game Name",
            style: TextStyle(
              fontFamily: 'OtomanopeeOne-Regular',
              fontSize: 50,
            ),
          ),
        ),
        // InstanceOfGame(
        //   numberOfCards: (min + random.nextInt(max - min)),
        // ),
      ]),
    );
  }
}

class InstanceOfGame extends StatelessWidget {
  final List<Image> imgs = [
    Image.asset('assets/images/bird.png'),
    Image.asset('assets/images/monkey.png'),
    Image.asset('assets/images/owls.png')
  ];

  final int numberOfCards;
  InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        for (var i = 0; i < numberOfCards; i++)
          Container(
            height: MediaQuery.of(context).size.height / 2 * numberOfCards,
            width: MediaQuery.of(context).size.height / 2 * numberOfCards,
            child: Alpha(
              img: imgs[1],
            ),
          ),
        Options(numberOfCards),
      ],
    ));
  }
}

class Alpha extends StatelessWidget {
  final Image img;
  const Alpha({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return img;
  }
}

class Options extends StatelessWidget {
  final int _rightAnswer;
  Options(this._rightAnswer);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: [
          DisplayOptionCard(_rightAnswer + 2, _rightAnswer),
          DisplayOptionCard(_rightAnswer + 3, _rightAnswer),
          DisplayOptionCard(_rightAnswer, _rightAnswer),
          DisplayOptionCard(_rightAnswer * 2, _rightAnswer),
        ],
      ),
    );
  }
}

class DisplayOptionCard extends StatelessWidget {
  final int _optionValue;
  final int _rightAnswer;
  DisplayOptionCard(this._optionValue, this._rightAnswer);
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        color: Colors.red[800],
        child: InkWell(
            child: Card(
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    //borderRadius: BorderRadius.all(4),
                  ),
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    (_optionValue).toString(),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            onTap: () {
              if (_optionValue == _rightAnswer) {
                print('Excellent!');
              } else
                print('Try again.');
            }));
  }
}
