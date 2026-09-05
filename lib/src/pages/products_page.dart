import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? data;

  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate network delay
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode != 200) throw Exception('Failed to load data');
    log('Data fetched: ${response.body}');
    return response.body;
  }

  @override
  void initState() {
    _fetchData().then((value) => setState(() => data = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Page')),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  data ?? 'No data',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
    );
  }
}
