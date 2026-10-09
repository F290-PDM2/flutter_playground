// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(findAllQuotes)
final findAllQuotesProvider = FindAllQuotesProvider._();

final class FindAllQuotesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<QuoteModel>>,
          List<QuoteModel>,
          FutureOr<List<QuoteModel>>
        >
    with $FutureModifier<List<QuoteModel>>, $FutureProvider<List<QuoteModel>> {
  FindAllQuotesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'findAllQuotesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$findAllQuotesHash();

  @$internal
  @override
  $FutureProviderElement<List<QuoteModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<QuoteModel>> create(Ref ref) {
    return findAllQuotes(ref);
  }
}

String _$findAllQuotesHash() => r'5d9dc07734c099ce509e0dab7728347cb3229cf9';
