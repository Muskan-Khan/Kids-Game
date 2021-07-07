import 'package:flutter/material.dart';
import 'display_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DisplayCard('Odd one out', Color(0xffEF3C11)),
              DisplayCard('Choose one', Color(0xff1DB545)),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DisplayCard('Puzzle', Color(0xffF9A009)),
              DisplayCard('Counting', Color(0xffB8190D)),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DisplayCard('Puzzle', Color(0xffD1245C)),
              DisplayCard('Counting', Color(0xff06BFDC)),
            ],
          ),
        ],
      )),
    );
  }
}
