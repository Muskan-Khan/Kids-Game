import 'package:flutter/material.dart';
// import 'HomeScreen/background.dart';
import 'Games/counting_screen.dart';
// import 'Games/games_background.dart';
// import 'Games/matching_color.dart';
// import 'Games/odd_one_out.dart';

// void main() {
//   runApp(MaterialApp(home: Background()));
// }
// void main() {
//   runApp(const MaterialApp(
//     home: OddOneOut(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     home: MatchingColors(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// void main() {
//   runApp(MaterialApp(home: Foreground()));
// }

void main() => runApp(const MaterialApp(
      home: CountingScreen(),
      debugShowCheckedModeBanner: false,
    ));

// void main() {
//   runApp(MaterialApp(
//     home: AudioPlayer(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class AudioPlayer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ElevatedButton(
//         child: Text("Play Audio"),
//         onPressed: onPlayAudio,
//       ),
//     );
//   }

//   void onPlayAudio() async {
//     AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
//   }
// }
