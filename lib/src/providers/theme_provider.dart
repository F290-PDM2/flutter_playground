import 'package:flutter/material.dart';
import 'package:flutter_playground/src/providers/theme_scope.dart';

class ThemeProvider extends StatefulWidget {
  const ThemeProvider({super.key, required this.child});

  final Widget child;

  @override
  State<ThemeProvider> createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  bool _isDark = false;

  void _toogle(bool value) => setState(() => _isDark = value);

  @override
  Widget build(BuildContext context) {
    return ThemeScope(
      isDarkTheme: _isDark,
      toogleBrightness: _toogle,
      child: widget.child,
    );
  }
}
