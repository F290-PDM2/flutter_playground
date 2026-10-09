import 'package:flutter_playground/src/features/quotes/data/quotes_repository.dart';
import 'package:flutter_playground/src/features/quotes/domain/quote_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quotes_providers.g.dart';

@riverpod
Future<List<QuoteModel>> findAllQuotes(Ref ref) async {
  return await ref.watch(quotesRespositoryProvider).findAll();
}
