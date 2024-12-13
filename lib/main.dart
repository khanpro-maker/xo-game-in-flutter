import 'package:appone/screens/GameScreen.dart';
import 'package:appone/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
      routes: {
        '/GameScreen': (context) => const Gamescreen(),
      },
    );
  }
}
