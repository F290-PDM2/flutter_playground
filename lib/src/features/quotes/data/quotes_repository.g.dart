// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quotesRespository)
final quotesRespositoryProvider = QuotesRespositoryProvider._();

final class QuotesRespositoryProvider
    extends
        $FunctionalProvider<
          QuotesRepository,
          QuotesRepository,
          QuotesRepository
        >
    with $Provider<QuotesRepository> {
  QuotesRespositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quotesRespositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quotesRespositoryHash();

  @$internal
  @override
  $ProviderElement<QuotesRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuotesRepository create(Ref ref) {
    return quotesRespository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuotesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuotesRepository>(value),
    );
  }
}

String _$quotesRespositoryHash() => r'a70475ab9ce17b962415f646e8a214d6b8f16226';
