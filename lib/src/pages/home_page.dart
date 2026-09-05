import 'package:flutter/material.dart';

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
          mainAxisAlignment: .center,
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(width: double.infinity),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/counter_stateless');
            }, child: Text('Statelles Counter')),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/counter_statefull');
            }, child: Text('Statefull Counter')),
            FilledButton(onPressed: () {
              Navigator.pushNamed(context, '/products');
            }, child: Text('Products Page')),
          ],
        ),
      ),
    );
  }
}
