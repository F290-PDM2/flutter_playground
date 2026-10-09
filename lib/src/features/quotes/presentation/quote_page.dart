import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/quotes/presentation/providers/quotes_providers.dart';
import 'package:flutter_playground/src/features/quotes/presentation/widgets/quote_list_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotePage extends ConsumerWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotes = ref.watch(findAllQuotesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('DummyJson Quote')),
      body: quotes.when(
        data: (data) => QuoteListWidget(quotes: data),
        error: (error, _) => Center(child: Text('Error: ${error.toString()}')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
