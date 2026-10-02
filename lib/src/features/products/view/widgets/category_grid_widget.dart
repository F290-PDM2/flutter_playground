import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';

class CategoryGridWidget extends StatelessWidget {
  const CategoryGridWidget({super.key, required this.data});

  final List<CategoryModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Card(child: Text(item.name));
      },
    );
  }
}
