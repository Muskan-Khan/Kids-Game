import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String _cardText;
  final Color _color;
  DisplayCard(this._cardText, this._color);
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
          width: 270,
          height: 200,
          child: Center(
            child: Text(
              _cardText,
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          )),
      color: _color,
    );
  }
}
