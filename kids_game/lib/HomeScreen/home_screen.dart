import 'package:flutter/material.dart';
import 'display_card.dart';
import 'background.dart';
import 'foreground.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DisplayCard('Odd one out', 'odds', const Color(0xffEF3C11)),
                    DisplayCard(
                        'Choose one', 'choose', const Color(0xff1DB545)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DisplayCard('Erect', 'erect', const Color(0xffF9A009)),
                    DisplayCard(
                        'Counting', 'counting', const Color(0xffB8190D)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DisplayCard('Colors', 'colors', const Color(0xffD1245C)),
                    DisplayCard('A4Apple', 'a4apple', const Color(0xff06BFDC)),
                  ],
                ),
              ],
            )),
        const Foreground()
      ],
    );
  }
}
