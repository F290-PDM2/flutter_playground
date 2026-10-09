import 'package:dio/dio.dart';
import 'package:flutter_playground/src/features/quotes/domain/quote_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/providers/core_providers.dart';

part 'quotes_repository.g.dart';

class QuotesRepository {
  final Dio dio;

  QuotesRepository({required this.dio});

  Future<List<QuoteModel>> findAll() async {
    final response = await dio.get('/quotes');
    return [
      for (final json in response.data['quotes']) QuoteModel.fromJson(json),
    ];
  }
}

@riverpod
QuotesRepository quotesRespository(Ref ref) {
  return QuotesRepository(dio: ref.watch(dioProvider));
}
