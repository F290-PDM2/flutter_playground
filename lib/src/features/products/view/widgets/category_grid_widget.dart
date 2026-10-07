import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';
import 'package:flutter_playground/src/features/products/view/widgets/category_widget.dart';

class CategoryGridWidget extends StatelessWidget {
  const CategoryGridWidget({super.key, required this.data});

  final List<CategoryModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 3,
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return CategoryWidget(item: item);
        },
      ),
    );
  }
}
