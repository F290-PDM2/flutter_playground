import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Tema escuro'),
            subtitle: Text('Modifica o brightness do aplicativo'),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
