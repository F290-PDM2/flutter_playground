import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final darkThemeProvider = StateProvider<bool>((ref) => false);
final colorThemeProvider = StateProvider<Color>((ref) => Colors.blue);

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
