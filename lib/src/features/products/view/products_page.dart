import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';
import 'package:flutter_playground/src/features/products/view/widgets/product_list_widget.dart';
import 'package:flutter_playground/src/features/products/viewmodel/category_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final products = ref.watch(productsByCategoryProvider(category.slug));
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: products.when(
        data: (data) => ListProductsWidget(products: data),
        error: (e, st) => Center(child: Text(e.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}