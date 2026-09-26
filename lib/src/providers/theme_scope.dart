import 'package:flutter/material.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required super.child,
    required this.isDarkTheme,
    required this.toogleBrightness
  });

  final bool isDarkTheme;
  final Function(bool) toogleBrightness;

  static ThemeScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) {
    return oldWidget.isDarkTheme != isDarkTheme;
  }
}
