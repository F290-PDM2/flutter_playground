import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? _data;

  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate network delay
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    _fetchData().then((response) => setState(() => _data = response));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products Page')),
      body: _data == null
          ? Center(child: CircularProgressIndicator())
          : Text(_data ?? 'Falha na requisição de produtos'),
    );
  }
}
