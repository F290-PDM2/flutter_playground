import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.item});

  final CategoryModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/products', arguments: item);
        },
        child: Ink(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                bottom: Random().nextDouble() * 100,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Theme.of(context).colorScheme.primary
                        .withValues(alpha: 0.5),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: Random().nextDouble() * 100,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primaryFixedDim
                          .withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(fontWeight: .bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
