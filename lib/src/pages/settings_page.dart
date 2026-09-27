import 'package:flutter/material.dart';
import 'package:flutter_playground/src/providers/theme_rovider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          SwitchListTile(
            title: Text('Tema escuro'),
            subtitle: Text('Modifica o brightness do aplicativo'),
            value: provider.isDarkTheme,
            onChanged: (value) => provider.toogleBrightness(value),
          ),
          DropdownMenu<Color>(
            expandedInsets: EdgeInsets.symmetric(horizontal: 16),
            leadingIcon: Icon(Icons.palette, color: provider.colorTheme),
            onSelected: (value) => provider.changeColor(value!),
            dropdownMenuEntries: [
              for (var color in Colors.primaries)
                DropdownMenuEntry(
                  value: color,
                  label: provider.getColorName(color) ?? 'Cor',
                  leadingIcon: Icon(Icons.palette, color: color),
                ),
            ],
            hintText: 'Escolha uma cor',
            label: Text('Cor primária'),
          ),
        ],
      ),
    );
  }
}
