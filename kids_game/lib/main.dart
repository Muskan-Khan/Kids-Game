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
      child: InstanceOfGame(
        numberOfCards: 3,
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

  // imgs.add();
  final int numberOfCards;
  InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < numberOfCards; i++)
          Alpha(
            img: imgs[1],
          ),
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
