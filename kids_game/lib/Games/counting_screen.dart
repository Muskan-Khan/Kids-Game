import 'package:flutter/material.dart';
import 'dart:math';
import './counting_screen.dart';

import 'package:kids_game/HomeScreen/background.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({Key? key}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  var random = new Random();
  final min = 2;
  final max = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(children: [
            Background(),
            Text('Game Name'),
          ]),
          InstanceOfGame(
            numberOfCards: (min + random.nextInt(max - min)),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 80.0,
            ),
            child: Image.asset(
              'assets/images/vippng.com-grass-background-png-92811.png',
            ),
          )
        ],
      ),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        for (var i = 0; i < numberOfCards; i++)
          Alpha(
            img: imgs[1],
          ),
        Options(numberOfCards),
      ],
    );
  }
}

class Alpha extends StatelessWidget {
  final Image img;
  Alpha({Key? key, required this.img}) : super(key: key);
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

          // Card(
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(0),
          //       side: BorderSide(
          //         color: Colors.black,
          //       )),
          //   child: Center(
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       color: Colors.blue,
          //       padding: EdgeInsets.all(2.0),
          //       child: Text(
          //         (_rightAnswer * 2).toString(),
          //         textDirection: TextDirection.ltr,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // Card(
          //   child: Center(
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       color: Colors.blue,
          //       padding: EdgeInsets.all(2.0),
          //       child: Text(
          //         (_rightAnswer + 2).toString(),
          //         textDirection: TextDirection.ltr,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // Card(
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(0),
          //       side: BorderSide(
          //         color: Colors.black,
          //       )),
          //   child: Center(
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       color: Colors.blue,
          //       padding: EdgeInsets.all(2.0),
          //       child: Text(
          //         (_rightAnswer * 1.5).toString(),
          //         textDirection: TextDirection.ltr,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // Card(
          //   child: Center(
          //     child: Container(
          //       height: 80,
          //       width: 80,
          //       color: Colors.blue,
          //       padding: EdgeInsets.all(2.0),
          //       child: Text(
          //         (_rightAnswer + 3).toString(),
          //         textDirection: TextDirection.ltr,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
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
                  fontWeight:FontWeight.bold
                
              ),
            ),
          ),
        ),
        onTap: () {
          if (_optionValue == _rightAnswer) {
            print('Excellent!');
          } else
            print('Try again.');
        },
      ),
    );
  }
}
