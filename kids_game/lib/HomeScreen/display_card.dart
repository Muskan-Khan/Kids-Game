import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String _cardText;
  final Color _color;
  DisplayCard(this._cardText, this._color);
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    // final screen_width = screen_size;
    final screen_height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: screen_width / 150,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
          width: screen_width / 2.8,
          height: screen_height / 5.9,
          child: Center(
              child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              _cardText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'OtomanopeeOne-Regular',
                fontSize: screen_width / 15,
                color: Colors.white,
              ),
            ),
          ))),
      color: _color,
    );
  }
}
