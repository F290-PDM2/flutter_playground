import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_statefull_page.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';
import 'package:flutter_playground/src/pages/detail_product_page.dart';
import 'package:flutter_playground/src/pages/home_page.dart';
import 'package:flutter_playground/src/pages/material_design_page.dart';
import 'package:flutter_playground/src/pages/categories_page.dart';
import 'package:flutter_playground/src/pages/products_page.dart';
import 'package:flutter_playground/src/pages/quote_page.dart';
import 'package:flutter_playground/src/pages/settings_page.dart';

class App extends StatelessWidget {
  App({super.key});



  // final lightTheme = ThemeData(
  //   useMaterial3: false,
  //   colorScheme: ColorScheme.fromSwatch(
  //     primarySwatch: Colors.deepPurple,
  //     accentColor: Colors.pink,
  //     brightness: Brightness.light,
  //   )
  // );

  final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: .light,
        seedColor: Color(0Xff1A56DB))
        .copyWith(secondary: Color(0xFFEBF2FF), tertiary: Color(0xFF1A3C88)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: null,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Playground',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/stateless-counter': (context) => CounterStatelessPage(),
        '/statefull-counter': (context) => CounterStatefullPage(),
        '/product-categories': (context) => ProductCategoriesPage(),
        '/quote': (context) => QuotePage(),
        '/material': (context) => MaterialDesignPage(),
        '/products' : (context) => ProductsPage(),
        '/product-details' : (context) => DetailProductPage(),
        '/settings' : (context) => SettingsPage(),
      },
    );
  }
}

//<editor-fold desc="Colors" defaultState="collapsed">
// #1A56BB
const MaterialColor primaryColor = MaterialColor(0xFF1A56BB, <int, Color>{
  50: Color(0xFFE8EEF8),
  100: Color(0xFFBACCEB),
  200: Color(0xFF8DAADE),
  300: Color(0xFF5F89D1),
  400: Color(0xFF3C6FC7),
  500: Color(0xFF1A56BB), // Cor original
  600: Color(0xFF174EAA),
  700: Color(0xFF134497),
  800: Color(0xFF103B84),
  900: Color(0xFF092A61),
});
//</editor-fold>
