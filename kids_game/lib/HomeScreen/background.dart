// import 'package:flutter/material.dart';
// // import 'HomeScreen/home_screen.dart';

// void main() {
//   runApp(MyApp());
// }

import 'package:flutter/material.dart';

void main() {
  runApp(Background());
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Background'),
        toolbarHeight: 1,
      ),
      body: ClipPath(
        clipper: ShadeOfCloud(),
        child: Container(
          color: Color(0xff14C7DF),
          // height: 118.0,
        ),
      ),
    );
  }
}

class ShadeOfCloud extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 4);
    path.quadraticBezierTo(
        size.width / 5.5, size.height / 3.5, size.width / 4, size.height / 5);
    path.quadraticBezierTo(
        size.width / 3, size.height / 4.4, size.width / 2.6, size.height / 7);
    path.close();
    path.moveTo(size.width / 2.6, size.height / 7);
    path.quadraticBezierTo(size.width / 1.9, size.height / 4.9,
        size.width / 1.7, size.height / 9.5);

    path.close();
    path.moveTo(size.width / 1.7, size.height / 9.5);
    path.quadraticBezierTo(
        size.width / 1.5, size.height / 6, size.width / 1.2, size.height / 9.4);
    path.close();
    path.moveTo(size.width / 1.2, size.height / 9.4);
    path.quadraticBezierTo(
        size.width / 1.2, size.height / 4.4, size.width, size.height / 4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 4);
    path.lineTo(size.width / 2.6, size.height / 7);
    path.lineTo(size.width / 1.7, size.height / 9.5);
    path.lineTo(size.width / 1.2, size.height / 9.4);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
