import 'package:flutter/material.dart';

class CounterStatelessPage extends StatelessWidget {
  const CounterStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text('0', style: Theme.of(context).textTheme.displayLarge),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}