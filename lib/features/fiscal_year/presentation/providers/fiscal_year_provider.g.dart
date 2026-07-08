// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiscal_year_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fiscalYears)
final fiscalYearsProvider = FiscalYearsProvider._();

final class FiscalYearsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FiscalYearModel>>,
          List<FiscalYearModel>,
          FutureOr<List<FiscalYearModel>>
        >
    with
        $FutureModifier<List<FiscalYearModel>>,
        $FutureProvider<List<FiscalYearModel>> {
  FiscalYearsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fiscalYearsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fiscalYearsHash();

  @$internal
  @override
  $FutureProviderElement<List<FiscalYearModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FiscalYearModel>> create(Ref ref) {
    return fiscalYears(ref);
  }
}

String _$fiscalYearsHash() => r'5f6ac5aa7587642ce3113c5d27af1a191324e1c9';
