import 'package:flutter/material.dart';
import 'HomeScreen/home_screen.dart';
import 'Games/counting_screen.dart';
import 'Games/Orientation.dart';
import 'Games/matching_color.dart';
import 'Games/odd_one_out.dart';
import 'Games/phonics.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/odds':
        return MaterialPageRoute(builder: (_) => const OddOneOut());
      case '/choose':
        //We need to add for this one case
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/erect':
        return MaterialPageRoute(builder: (_) => const ProperOrientation());
      case '/counting':
        return MaterialPageRoute(builder: (_) => const CountingScreen());
      case '/colors':
        return MaterialPageRoute(builder: (_) => const MatchingColors());
      case '/a4apple':
        return MaterialPageRoute(builder: (_) => const Phonics());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const HomeScreen();
    });
  }
}
