import 'package:flutter/material.dart';
import 'package:flutter_playground/src/app.dart';
import 'package:flutter_playground/src/providers/theme_rovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: App()
    ),
  );
}
