import 'package:flutter/material.dart';
import 'package:flutter_playground/src/providers/theme_rovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../viewmodel/settings_viewmodel.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          SwitchListTile(
            title: Text('Tema escuro'),
            subtitle: Text('Modifica o brightness do aplicativo'),
            value: ref.watch(darkThemeProvider),
            onChanged: (value) => ref.read(darkThemeProvider.notifier).state = value,
          ),
          DropdownMenu<Color>(
            expandedInsets: EdgeInsets.symmetric(horizontal: 16),
            leadingIcon: Icon(Icons.palette, color: ref.watch(colorThemeProvider)),
            onSelected: (value) => ref.read(colorThemeProvider.notifier).state = value!,
            dropdownMenuEntries: [
              for (var color in Colors.primaries)
                DropdownMenuEntry(
                  value: color,
                  label: getColorName(color) ?? 'Cor',
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
