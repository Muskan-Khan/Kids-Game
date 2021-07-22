import 'package:flutter/material.dart';
// import 'package:kids_game/Games/counting_screen.dart';
// import 'HomeScreen/background.dart';
// import 'Games/counting_screen.dart';
// import 'Games/games_background.dart';
import 'Games/matching_color.dart';

// void main() {
//   runApp(MaterialApp(home: Background()));
// }
// void main() {
//   runApp(MaterialApp(
//     home: OddOneOut(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

void main() {
  runApp(MaterialApp(
    home: MatchingColors(),
    debugShowCheckedModeBanner: false,
  ));
}



// void main() {
//   runApp(MaterialApp(home: Foreground()));
// }

// void main() => runApp(MaterialApp(
//       home: CountingScreen(),
//       debugShowCheckedModeBanner: false,
//     ));


// // // // // // class CountingScreen extends StatefulWidget {
// // // // // //   const CountingScreen({Key? key}) : super(key: key);

// // // // // //   @override
// // // // // //   _CountingScreenState createState() => _CountingScreenState();
// // // // // // }

// // // // // // class _CountingScreenState extends State<CountingScreen> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Center(
// // // // // //         child: InstanceOfGame(
// // // // // //       numberOfCards: 4,
// // // // // //     ));
// // // // // //   }
// // // // // // }

// // // // // // class InstanceOfGame extends StatelessWidget {
// // // // // //   final List<Image> imgs = [
// // // // // //     Image.asset('assets/images/bird.png'),
// // // // // //     Image.asset('assets/images/monkey.png'),
// // // // // //     Image.asset('assets/images/owls.png')
// // // // // //   ];

// // // // // //   final int numberOfCards;
// // // // // //   InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       mainAxisSize: MainAxisSize.max,
// // // // // //       verticalDirection: VerticalDirection.down,
// // // // // //       textDirection: TextDirection.ltr,
// // // // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // // // //       children: <Widget>[
// // // // // //         for (var i = 0; i < numberOfCards; i++)
// // // // // //           Flexible(
// // // // // //             flex: 1,
// // // // // //             child: Container(
// // // // // //               padding: EdgeInsets.only(left: 100 * (i % 2).toDouble()),
// // // // // //               child: Alpha(
// // // // // //                 img: imgs[1],
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         Options(4)
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class Alpha extends StatelessWidget {
// // // // // //   final Image img;
// // // // // //   Alpha({Key? key, required this.img}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return img;
// // // // // //   }
// // // // // // }

// // // // // // class Options extends StatelessWidget {
// // // // // //   final int rightAnswer;
// // // // // //   Options(this.rightAnswer);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //       child: Row(
// // // // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // // // //         mainAxisSize: MainAxisSize.max,
// // // // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //         textDirection: TextDirection.ltr,
// // // // // //         verticalDirection: VerticalDirection.down,
// // // // // //         textBaseline: TextBaseline.alphabetic,
// // // // // //         children: [
// // // // // //           Card(
// // // // // //             shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(0),
// // // // // //                 side: BorderSide(
// // // // // //                   color: Colors.black,
// // // // // //                 )),
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer * 2).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             child: Center(
// // // // // //                 child: Container(
// // // // // //                     height: 80,
// // // // // //                     width: 80,
// // // // // //                     color: Colors.blue,
// // // // // //                     padding: EdgeInsets.all(2.0),
// // // // // //                     child: Center(
// // // // // //                       child: Text(
// // // // // //                         (rightAnswer + 2).toString(),
// // // // // //                         textDirection: TextDirection.ltr,
// // // // // //                         textAlign: TextAlign.center,
// // // // // //                         style: TextStyle(fontSize: 50),
// // // // // //                       ),
// // // // // //                     ))),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(0),
// // // // // //                 side: BorderSide(
// // // // // //                   color: Colors.black,
// // // // // //                 )),
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer * 1.5).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //           Card(
// // // // // //             child: Center(
// // // // // //               child: Container(
// // // // // //                   height: 80,
// // // // // //                   width: 80,
// // // // // //                   color: Colors.blue,
// // // // // //                   padding: EdgeInsets.all(2.0),
// // // // // //                   child: Center(
// // // // // //                     child: Text(
// // // // // //                       (rightAnswer + 3).toString(),
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       textAlign: TextAlign.center,
// // // // // //                       style: TextStyle(fontSize: 50),
// // // // // //                     ),
// // // // // //                   )),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
















// // // // // // import 'package:flutter/material.dart';

// // // // // // void main() => runApp(CountingScreen());

// // // // // // class CountingScreen extends StatefulWidget {
// // // // // //   const CountingScreen({Key? key}) : super(key: key);
// // // // // //   @override
// // // // // //   _CountingScreenState createState() => _CountingScreenState();
// // // // // // }

// // // // // // class _CountingScreenState extends State<CountingScreen> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Container(
// // // // // //         child: Column(
// // // // // //       children: [
// // // // // //         InstanceOfGame(
// // // // // //           numberOfCards: 3,
// // // // // //         ),
// // // // // //         InstanceOfGame(
// // // // // //           numberOfCards: 2,
// // // // // //         ),
// // // // // //       ],
// // // // // //     ));
// // // // // //   }
// // // // // // }

// // // // // // class InstanceOfGame extends StatelessWidget {
// // // // // //   final List<Image> imgs = [
// // // // // //     Image.asset('assets/images/bird.png'),
// // // // // //     Image.asset('assets/images/monkey.png'),
// // // // // //     Image.asset('assets/images/owls.png')
// // // // // //   ];
// // // // // //   // imgs.add();
// // // // // //   final int numberOfCards;
// // // // // //   InstanceOfGame({Key? key, required this.numberOfCards}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Column(
// // // // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //       children: <Widget>[
// // // // // //         for (var i = 0; i < numberOfCards; i++)
// // // // // //           Alpha(
// // // // // //             img: imgs[1],
// // // // // //           ),
// // // // // //         Options(rightAnswer: numberOfCards)
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // class Alpha extends StatelessWidget {
// // // // // //   final Image img;
// // // // // //   Alpha({Key? key, required this.img}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return img;
// // // // // //   }
// // // // // // }

// // // // // // class Options extends StatelessWidget {
// // // // // //   final int rightAnswer;
// // // // // //   const Options({Key? key, required this.rightAnswer}) : super(key: key);
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Row(
// // // // //       // mainAxisAlignment: MainAxisAlignment.start,
// // // // //       // mainAxisSize: MainAxisSize.max,
// // // // //       // crossAxisAlignment: CrossAxisAlignment.center,
// // // // //       // textDirection: TextDirection.ltr,
// // // // //       // verticalDirection: VerticalDirection.down,
// // // // //       // textBaseline: TextBaseline.alphabetic,
// // // // // //       // ignore: prefer_const_literals_to_create_immutables
// // // // // //       children: [
// // // // // //         const Card(
// // // // // //           color: Colors.red,
// // // // // //           shape: RoundedRectangleBorder(),
// // // // // //           child: Center(
// // // // // //             child: Text(
// // // // // //               "Right Answer",
// // // // // //               textDirection: TextDirection.ltr,
// // // // // //             ),
// // // // // //           ),
// // // // // //         )
// // // // // //       ],
// // // // // //     );
// // // // // //   }
// // // // // // }