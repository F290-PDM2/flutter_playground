// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuoteViewModel)
final quoteViewModelProvider = QuoteViewModelProvider._();

final class QuoteViewModelProvider
    extends $AsyncNotifierProvider<QuoteViewModel, List<QuoteModel>> {
  QuoteViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quoteViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quoteViewModelHash();

  @$internal
  @override
  QuoteViewModel create() => QuoteViewModel();
}

String _$quoteViewModelHash() => r'f451b2233a1af3a7ffdb74aef8cd07b731a21223';

abstract class _$QuoteViewModel extends $AsyncNotifier<List<QuoteModel>> {
  FutureOr<List<QuoteModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<QuoteModel>>, List<QuoteModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<QuoteModel>>, List<QuoteModel>>,
              AsyncValue<List<QuoteModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

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
