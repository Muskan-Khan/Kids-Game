import 'package:flutter/material.dart';

class Foreground extends StatelessWidget {
  const Foreground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: const Text(
              "Brainiacs",
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 50,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 100.0, bottom: 70.0),
          child: Image.asset(
            'assets/images/owls.png',
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 200.0, bottom: 50.0),
          child: Image.asset(
            'assets/images/bird.png',
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
          child: Image.asset(
            'assets/images/monkey.png',
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 60.0,
          ),
          child: Image.asset(
            'assets/images/carAndCart.png',
          ),
        ),
      ],
    );
  }
}
