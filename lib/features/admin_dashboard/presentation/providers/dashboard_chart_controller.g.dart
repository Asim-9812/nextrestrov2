// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_chart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardChartController)
final dashboardChartControllerProvider = DashboardChartControllerProvider._();

final class DashboardChartControllerProvider
    extends
        $AsyncNotifierProvider<DashboardChartController, DashboardChartState> {
  DashboardChartControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardChartControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardChartControllerHash();

  @$internal
  @override
  DashboardChartController create() => DashboardChartController();
}

String _$dashboardChartControllerHash() =>
    r'04d90798a77458bbac1f425c1ac8f925c193ae05';

abstract class _$DashboardChartController
    extends $AsyncNotifier<DashboardChartState> {
  FutureOr<DashboardChartState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DashboardChartState>, DashboardChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DashboardChartState>, DashboardChartState>,
              AsyncValue<DashboardChartState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
