import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  //TODO: Fazer requisicão ao end-point [https://dummyjson.com/quotes/random]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DummyJson Quote')),
      //TODO: Utilizar o FutureBuilder para transacionar a requisição REST e controlar o estado da UI
      body: Center(
        child: Card(
          margin: .all(16),
          child: Padding(
            padding: .all(16.0),
            child: Text(
              'Mussum ipsum cacildis vidis litrus abertis',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: Icon(Icons.format_quote_outlined),
      ),
    );
  }
}
