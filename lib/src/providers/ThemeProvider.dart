import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required super.child,
    required this.isDarkTheme,
    required this.toogleBrightness
  });

  final bool isDarkTheme;
  final Function(bool) toogleBrightness;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return oldWidget.isDarkTheme != isDarkTheme;
  }
}
