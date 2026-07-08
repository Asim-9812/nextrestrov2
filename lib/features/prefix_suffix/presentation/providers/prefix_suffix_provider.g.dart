// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefix_suffix_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(prefixSuffixes)
final prefixSuffixesProvider = PrefixSuffixesProvider._();

final class PrefixSuffixesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PrefixSuffixModel>>,
          List<PrefixSuffixModel>,
          FutureOr<List<PrefixSuffixModel>>
        >
    with
        $FutureModifier<List<PrefixSuffixModel>>,
        $FutureProvider<List<PrefixSuffixModel>> {
  PrefixSuffixesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prefixSuffixesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prefixSuffixesHash();

  @$internal
  @override
  $FutureProviderElement<List<PrefixSuffixModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PrefixSuffixModel>> create(Ref ref) {
    return prefixSuffixes(ref);
  }
}

String _$prefixSuffixesHash() => r'86b422790eae4e7fb2775462a76df8573837dea2';
