import 'package:flutter/material.dart';

void main() {
  runApp(Background());
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background',
      home: Scaffold(
        appBar: AppBar(
          // title: Text('Background'),
          toolbarHeight: 1,
        ),
        body: ClipPath(
          clipper: ShadeOfCloud(),
          child: Container(
            color: Color(0xffE6FCFF),
            // height: 118.0,
          ),
        ),
      ),
    );
  }
}

class ShadeOfCloud extends CustomClipper<Path> {
  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  Path getClip(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 4);
    canvas.drawPath(path, _paint);
    path.quadraticBezierTo(
        size.width / 5.5, size.height / 3.5, size.width / 4, size.height / 5);
    path.quadraticBezierTo(
        size.width / 3, size.height / 4.4, size.width / 2.6, size.height / 7);
    canvas.drawPath(path, _paint);

    path.close();
    path.moveTo(size.width / 2.6, size.height / 7);
    path.quadraticBezierTo(size.width / 1.9, size.height / 4.9,
        size.width / 1.7, size.height / 9.5);
    canvas.drawPath(path, _paint);

    path.close();
    path.moveTo(size.width / 1.7, size.height / 9.5);
    path.quadraticBezierTo(
        size.width / 1.5, size.height / 6, size.width / 1.2, size.height / 9.4);
    canvas.drawPath(path, _paint);

    path.close();
    path.moveTo(size.width / 1.2, size.height / 9.4);
    path.quadraticBezierTo(
        size.width / 1.2, size.height / 4.4, size.width, size.height / 4);
    canvas.drawPath(path, _paint);

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


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
