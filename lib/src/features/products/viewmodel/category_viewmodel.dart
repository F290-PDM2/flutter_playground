import 'package:flutter_playground/src/features/products/model/category_model.dart';
import 'package:flutter_playground/src/features/products/model/category_repository.dart';
import 'package:flutter_playground/src/features/products/model/product_model.dart';
import 'package:flutter_playground/src/features/products/model/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';

part 'category_viewmodel.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository(dio: ref.watch(dioProvider));
}

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<List<CategoryModel>> categories(Ref ref) async {
  return await ref.watch(categoryRepositoryProvider).findAll();
}

@riverpod
Future<List<ProductModel>> productsByCategory(Ref ref, String category) async {
  return await ref.watch(productRepositoryProvider).findByCategory(category);
}