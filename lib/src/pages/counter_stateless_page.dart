import 'dart:developer';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterStatelessPage extends StatelessWidget {
  CounterStatelessPage({super.key});

  int _counter = 0;

  void _increment() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    log('CounterStatelessPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(_counter.toString(), style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
          log('Counter: $_counter');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}