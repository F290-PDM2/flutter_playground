import 'package:flutter_playground/src/core/providers/core_providers.dart';
import 'package:flutter_playground/src/features/quotes/data/quotes_repository.dart';
import 'package:flutter_playground/src/features/quotes/domain/quote_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quotes_providers.g.dart';

@Riverpod(keepAlive: true)
class QuoteViewModel extends _$QuoteViewModel {
  @override
  Future<List<QuoteModel>>build() async {
    return [];
  }

  Future<void> add() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref.read(dioProvider).get('/quotes/random');
      final quote = QuoteModel.fromJson(response.data);
      return [...state.value!, quote];
    });
  }
}

@riverpod
Future<List<QuoteModel>> findAllQuotes(Ref ref) async {
  return await ref.watch(quotesRespositoryProvider).findAll();
}
