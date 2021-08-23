import 'package:flutter/material.dart';
import 'package:kids_game/HomeScreen/background.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.835,
          ),
          child: Image.asset(
            'assets/images/vippng.com-grass-background-png-92811.png',
            width: MediaQuery.of(context).size.width * 1.5,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
