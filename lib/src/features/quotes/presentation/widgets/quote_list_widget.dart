import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/quotes/presentation/widgets/quote_card_widget.dart';

import '../../domain/quote_model.dart';

class QuoteListWidget extends StatelessWidget {
  const QuoteListWidget({super.key, required this.quotes});

  final List<QuoteModel> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return QuoteCardWidget(model: quote);
      },
    );
  }
}
