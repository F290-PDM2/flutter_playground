import 'package:dio/dio.dart';
import 'package:flutter_playground/src/core/providers/core_providers.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  final Dio dio;

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> findAll() async {
    final response = await dio.get('/categories');
    return [for (final json in response.data) CategoryModel.fromJson(json)];
  }
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository(dio: ref.watch(dioProvider));
}
