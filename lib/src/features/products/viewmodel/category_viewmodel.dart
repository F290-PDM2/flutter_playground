import 'package:flutter_playground/src/features/products/model/category_model.dart';
import 'package:flutter_playground/src/features/products/model/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_viewmodel.g.dart';

@riverpod
Future<List<CategoryModel>> categories(Ref ref) async {
  return await ref.watch(categoryRepositoryProvider).findAll();
}