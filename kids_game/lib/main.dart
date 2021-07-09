import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(CountingScreen());

class CountingScreen extends StatefulWidget {
  const CountingScreen({Key? key}) : super(key: key);

  @override
  _CountingScreenState createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        InstanceOfGame(
          numberOfCards: 3,
        ),
        InstanceOfGame(
          numberOfCards: 2,
        ),
      ],
    ));
  }
}

class InstanceOfGame extends StatelessWidget {
  final List<Image> imgs = [
    Image.asset('assets/images/bird.png'),
    Image.asset('assets/images/monkey.png'),
    Image.asset('assets/images/owls.png')
  ];

  // imgs.add();
  final int numberOfCards;
  InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  final int rightAnswer;
  Options(this.rightAnswer);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide(
                  color: Colors.black,
                )),
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.blue,
                padding: EdgeInsets.all(2.0),
                child: Text((rightAnswer * 2).toString()),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide(
                  color: Colors.black,
                )),
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.blue,
                padding: EdgeInsets.all(2.0),
                child: Text((rightAnswer + 2).toString()),
              ),
            ),
          ),
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
          //       padding: EdgeInsets.all(8.0),
          //       child: Text((this.rightAnswer + 3).toString()),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
