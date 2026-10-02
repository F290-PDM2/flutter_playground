import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/products/view/widgets/category_grid_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:faker/faker.dart' as f;

import '../viewmodel/category_viewmodel.dart';

class ProductCategoriesPage extends ConsumerWidget {
  const ProductCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Product Categories Page')),
      body: categories.when(
        data: (data) => CategoryGridWidget(data: data),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
