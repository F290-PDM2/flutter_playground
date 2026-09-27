import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;
  Color colorTheme = Colors.blue;

  String? getColorName(MaterialColor color) {
    final Map<MaterialColor, String> materialColorNames = {
      Colors.red: 'red',
      Colors.pink: 'pink',
      Colors.purple: 'purple',
      Colors.deepPurple: 'deepPurple',
      Colors.indigo: 'indigo',
      Colors.blue: 'blue',
      Colors.lightBlue: 'lightBlue',
      Colors.cyan: 'cyan',
      Colors.teal: 'teal',
      Colors.green: 'green',
      Colors.lightGreen: 'lightGreen',
      Colors.lime: 'lime',
      Colors.yellow: 'yellow',
      Colors.amber: 'amber',
      Colors.orange: 'orange',
      Colors.deepOrange: 'deepOrange',
      Colors.brown: 'brown',
      Colors.grey: 'grey',
      Colors.blueGrey: 'blueGrey',
    };

    return materialColorNames[color];
  }

  void changeColor(Color color){
    colorTheme = color;
    notifyListeners();
  }

  void toogleBrightness(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }
}
