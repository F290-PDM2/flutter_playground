import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_statefull_page.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';
import 'package:flutter_playground/src/pages/home_page.dart';
import 'package:flutter_playground/src/pages/products_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/counter_stateless': (context) => CounterStatelessPage(),
        '/counter_statefull': (context) => const CounterStatefullPage(),
        '/products': (context) => const ProductsPage(),
      }
    );
  }
}