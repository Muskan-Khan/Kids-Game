import 'package:flutter/material.dart';
@immutable
class DisplayCard extends StatelessWidget {
  final String _cardText;
  final String _cardRoute;
  final Color _color;

  // ignore: prefer_const_constructors_in_immutables
  DisplayCard(this._cardText, this._cardRoute, this._color, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // print('hello');
            Navigator.of(context).pushNamed('/' + _cardRoute);
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
                  padding: const EdgeInsets.all(10.0),
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
