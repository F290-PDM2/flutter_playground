import 'package:flutter/material.dart';

class CounterStatefullPage extends StatefulWidget {
  const CounterStatefullPage({super.key});

  @override
  State<CounterStatefullPage> createState() => _CounterStatefullPageState();
}

class _CounterStatefullPageState extends State<CounterStatefullPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('CounterStatefullPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            _counter.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increment();
          print('Counter: $_counter');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
