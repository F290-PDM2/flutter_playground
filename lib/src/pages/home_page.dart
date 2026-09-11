import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_statefull_page.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';
import 'package:flutter_playground/src/pages/products_page.dart';
import 'package:flutter_playground/src/pages/widgtes/menu_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Playground')),
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
              route: '/products',
              icon: Icons.shopping_cart,
            ),
          ],
        ),
      ),
    );
  }
}
