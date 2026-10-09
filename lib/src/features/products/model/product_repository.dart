import 'package:dio/dio.dart';
import 'package:flutter_playground/src/features/products/model/product_model.dart';
class ProductRepository {
  final Dio dio;

  ProductRepository({required this.dio});

  Future<List<ProductModel>> findByCategory(String category) async {
    final products = await dio.get('/products/category/$category');
    return [for(final json in products.data['products']) ProductModel.fromJson(json)];
  }
}