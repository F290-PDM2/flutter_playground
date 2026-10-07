import 'package:dio/dio.dart';
import 'package:flutter_playground/src/features/products/model/category_model.dart';

class CategoryRepository {
  final Dio dio;

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> findAll() async {
    final response = await dio.get('/categories');
    return [for (final json in response.data) CategoryModel.fromJson(json)];
  }
}
