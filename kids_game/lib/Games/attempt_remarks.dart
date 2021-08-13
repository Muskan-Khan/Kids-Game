// import 'package:just_audio/just_audio.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late AudioPlayer player;
//   @override
//   void initState() {
//     super.initState();
//     player = AudioPlayer();
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   await player.setAsset('assets/audios/excellent.mp3');
//                   player.play();
//                 },
//                 child: Text('Cow'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () async {
//                   await player.setAsset('assets/audios/great.mp3');
//                   player.play();
//                 },
//                 child: Text('Horse'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
