import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String _cardText;
  final Color _color;

  DisplayCard(this._cardText, this._color);
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('hello');
          },
          child: Card(
            elevation: 50,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
                width: screenWidth / 150,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
                width: screenWidth / 2.8,
                height: screenHeight / 5.9,
                child: Center(
                    child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _cardText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'OtomanopeeOne-Regular',
                      fontSize: screenWidth / 15,
                      color: Colors.white,
                    ),
                  ),
                ))),
            color: _color,
          ),
        ));
  }
}
