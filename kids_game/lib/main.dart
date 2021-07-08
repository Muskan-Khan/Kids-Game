import 'package:flutter/material.dart';

void main() => runApp(CountingScreen());

class CountingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: InstanceOfGame(),
      ),
    );
  }
}

class InstanceOfGame extends StatelessWidget {
  final int n = 5;
  Alpha() {
    for (int i = 0; i < 1; i++) {
      Text(n.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Alpha()],
    );
  }
}
