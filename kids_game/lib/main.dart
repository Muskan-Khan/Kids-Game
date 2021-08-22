import 'package:flutter/material.dart';
import 'package:kids_game/route_generator.dart';
import 'HomeScreen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Home must be there in order to provide navigation capability
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      // Initially display FirstPage
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
