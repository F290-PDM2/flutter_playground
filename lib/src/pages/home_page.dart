import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/counter_stateless_page.dart';

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
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterStatelessPage(),
                  ),
                );
              },
              child: Text('Statelles Counter'),
            ),
            FilledButton(onPressed: () {}, child: Text('Statefull Counter')),
          ],
        ),
      ),
    );
  }
}
