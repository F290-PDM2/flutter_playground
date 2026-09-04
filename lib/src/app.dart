import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      home: const HomePage(),
    );
  }
}