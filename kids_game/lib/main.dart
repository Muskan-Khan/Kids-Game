import 'package:flutter/material.dart';
import 'package:kids_game/route_generator.dart';
import 'HomeScreen/home_screen.dart';

// import 'HomeScreen/background.dart';
// import 'Games/counting_screen.dart';

// import 'Games/orientation.dart';
// import 'Games/games_background.dart';
// import 'Games/matching_color.dart';
// import 'Games/odd_one_out.dart';
// import 'Games/phonics.dart';

// void main() => runApp(const MaterialApp(
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     ));

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      // Initially display FirstPage
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// class LandingScreen extends StatelessWidget {
//   const LandingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
// void main() => runApp(const MaterialApp(
//       home: ProperOrientation(),
//       debugShowCheckedModeBanner: false,
//     ));



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

// void main() => runApp(const MaterialApp(
//       home: CountingScreen(),
//       debugShowCheckedModeBanner: false,
//     ));

// void main() => runApp(const MaterialApp(
//       home: Phonics(),
//       debugShowCheckedModeBanner: false,
//     ));
