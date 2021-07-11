import 'package:flutter/material.dart';

class Foreground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(
              "Enigma",
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 50,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 100.0, bottom: 60.0),
          child: Image.asset(
            'assets/images/owls.png',
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 200.0, bottom: 50.0),
          child: Image.asset(
            'assets/images/bird.png',
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Image.asset(
            'assets/images/monkey.png',
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 60.0,
          ),
          child: Image.asset(
            'assets/images/carAndCart.png',
          ),
        ),
      ],
    ));
  }
}
