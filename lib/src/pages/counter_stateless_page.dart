import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final conterProvider = StateProvider<int>((ref) => 0);

class CounterStatelessPage extends ConsumerWidget {
  const CounterStatelessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('CounterStatelessPage build called');
    return Scaffold(
      appBar: AppBar(title: Text('Stateless Counter')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text(
            ref.watch(conterProvider).toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
      // Atenção: O FAB Button estara fora da coluna, mas dentro do Scaffold, para que ele fique no canto inferior direito da tela
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(conterProvider.notifier).state++;
          print('Counter: ${ref.read(conterProvider)}');
        },
        icon: Icon(Icons.add),
        label: Text('Increment'),
      ),
    );
  }
}
