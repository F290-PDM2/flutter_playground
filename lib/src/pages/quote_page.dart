import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/widgtes/quote_card_widget.dart';
import 'package:http/http.dart';

import '../model/quote_model.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  //TODO: Fazer requisicão ao end-point [https://dummyjson.com/quotes/random]

  Future<String> _fetchQuote() async {
    final response = await get(
      Uri.parse('https://dummyjson.com/quotes/random'),
    );
    if (response.statusCode == 200) return response.body;
    throw Exception("Erro ao buscar cotação");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DummyJson Quote')),
      body: FutureBuilder(
        future: _fetchQuote(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao buscar cotação'));
          }

          final String response = snapshot.data!;
          final quote = QuoteModel.fromJson(jsonDecode(response));
          return QuoteCardWidget(model: quote);
        },
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => setState(() {}),
        child: Icon(Icons.format_quote_outlined),
      ),
    );
  }
}
