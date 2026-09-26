import 'package:flutter/material.dart';
import 'package:flutter_playground/src/providers/theme_scope.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ThemeScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Tema escuro'),
            subtitle: Text('Modifica o brightness do aplicativo'),
            value: provider.isDarkTheme,
            onChanged: (value) => provider.toogleBrightness(value),
          ),
        ],
      ),
    );
  }
}
