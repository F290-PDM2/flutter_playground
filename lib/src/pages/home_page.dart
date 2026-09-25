import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/widgtes/menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Playground')),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
                subtitle: Text('Ajusta as configurações do aplicativo'),
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: .max,
          mainAxisAlignment: .start,
          children: [
            MenuItemWidget(
              title: 'Stateless Counter',
              subtitle: 'Demonstração Stateless Widget',
              route: '/stateless-counter',
            ),
            MenuItemWidget(
              title: 'Statefull Counter',
              subtitle: 'Demonstração Stateless Widget',
              route: '/statefull-counter',
              icon: Icons.add,
            ),
            MenuItemWidget(
              title: 'Products',
              subtitle: 'Statefull Widgets c/ Future API',
              route: '/product-categories',
              icon: Icons.shopping_cart,
            ),
            MenuItemWidget(
              title: 'Quote',
              subtitle: 'Trabalhando com JSON',
              route: '/quote',
              icon: Icons.format_quote,
            ),
            MenuItemWidget(
              title: 'Material Design',
              subtitle: 'Trabalhando M3',
              route: '/material',
              icon: Icons.color_lens,
            ),
          ],
        ),
      ),
    );
  }
}
