// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedMenuTab)
final selectedMenuTabProvider = SelectedMenuTabProvider._();

final class SelectedMenuTabProvider
    extends $NotifierProvider<SelectedMenuTab, int> {
  SelectedMenuTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedMenuTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedMenuTabHash();

  @$internal
  @override
  SelectedMenuTab create() => SelectedMenuTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedMenuTabHash() => r'5436ddcf8aa98f998c46c3041fd285e6805b6c70';

abstract class _$SelectedMenuTab extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CategoryExpanded)
final categoryExpandedProvider = CategoryExpandedProvider._();

final class CategoryExpandedProvider
    extends $NotifierProvider<CategoryExpanded, bool> {
  CategoryExpandedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryExpandedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryExpandedHash();

  @$internal
  @override
  CategoryExpanded create() => CategoryExpanded();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$categoryExpandedHash() => r'1590dfe012fe6aec72ebcbd119addbc0d5f5b95b';

abstract class _$CategoryExpanded extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProductExpanded)
final productExpandedProvider = ProductExpandedProvider._();

final class ProductExpandedProvider
    extends $NotifierProvider<ProductExpanded, bool> {
  ProductExpandedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productExpandedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productExpandedHash();

  @$internal
  @override
  ProductExpanded create() => ProductExpanded();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$productExpandedHash() => r'21d5f93c4201d36d2da0a6a0d632a60c693737c7';

abstract class _$ProductExpanded extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(MenuSearchQuery)
final menuSearchQueryProvider = MenuSearchQueryProvider._();

final class MenuSearchQueryProvider
    extends $NotifierProvider<MenuSearchQuery, String> {
  MenuSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuSearchQueryHash();

  @$internal
  @override
  MenuSearchQuery create() => MenuSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$menuSearchQueryHash() => r'dadd25e0193793357a3528d0804c3772d4929a1c';

abstract class _$MenuSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(categories)
final categoriesProvider = CategoriesProvider._();

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CategoryModel>>,
          List<CategoryModel>,
          FutureOr<List<CategoryModel>>
        >
    with
        $FutureModifier<List<CategoryModel>>,
        $FutureProvider<List<CategoryModel>> {
  CategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<CategoryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CategoryModel>> create(Ref ref) {
    return categories(ref);
  }
}

String _$categoriesHash() => r'613a358526511a21d76867265b9fff5df3b82784';

@ProviderFor(SelectedCategoryId)
final selectedCategoryIdProvider = SelectedCategoryIdProvider._();

final class SelectedCategoryIdProvider
    extends $NotifierProvider<SelectedCategoryId, int?> {
  SelectedCategoryIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryIdHash();

  @$internal
  @override
  SelectedCategoryId create() => SelectedCategoryId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedCategoryIdHash() =>
    r'8c70e3afc6ba1c356686adbcdaac8923970e68cc';

abstract class _$SelectedCategoryId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSubCategoryId)
final selectedSubCategoryIdProvider = SelectedSubCategoryIdProvider._();

final class SelectedSubCategoryIdProvider
    extends $NotifierProvider<SelectedSubCategoryId, int?> {
  SelectedSubCategoryIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSubCategoryIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSubCategoryIdHash();

  @$internal
  @override
  SelectedSubCategoryId create() => SelectedSubCategoryId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedSubCategoryIdHash() =>
    r'36a94fb2c3bb0baa108cfb9b7b4977fda429631d';

abstract class _$SelectedSubCategoryId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(menuItems)
final menuItemsProvider = MenuItemsProvider._();

final class MenuItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MenuItemModel>>,
          List<MenuItemModel>,
          FutureOr<List<MenuItemModel>>
        >
    with
        $FutureModifier<List<MenuItemModel>>,
        $FutureProvider<List<MenuItemModel>> {
  MenuItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<MenuItemModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MenuItemModel>> create(Ref ref) {
    return menuItems(ref);
  }
}

String _$menuItemsHash() => r'139be6e1f8d025193794cad137e5859bb03d8e00';

@ProviderFor(subCategories)
final subCategoriesProvider = SubCategoriesProvider._();

final class SubCategoriesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  SubCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return subCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$subCategoriesHash() => r'55479efb8d77a0f814c4bc73faad818ac39e2a3f';

@ProviderFor(filteredMenuItems)
final filteredMenuItemsProvider = FilteredMenuItemsProvider._();

final class FilteredMenuItemsProvider
    extends
        $FunctionalProvider<
          List<MenuItemModel>,
          List<MenuItemModel>,
          List<MenuItemModel>
        >
    with $Provider<List<MenuItemModel>> {
  FilteredMenuItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredMenuItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredMenuItemsHash();

  @$internal
  @override
  $ProviderElement<List<MenuItemModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<MenuItemModel> create(Ref ref) {
    return filteredMenuItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MenuItemModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MenuItemModel>>(value),
    );
  }
}

String _$filteredMenuItemsHash() => r'78bee3e660aa8d096f33c1876425c3ac352301b4';

@ProviderFor(SelectedSubCategoryName)
final selectedSubCategoryNameProvider = SelectedSubCategoryNameProvider._();

final class SelectedSubCategoryNameProvider
    extends $NotifierProvider<SelectedSubCategoryName, String> {
  SelectedSubCategoryNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSubCategoryNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSubCategoryNameHash();

  @$internal
  @override
  SelectedSubCategoryName create() => SelectedSubCategoryName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedSubCategoryNameHash() =>
    r'b5fc28ea211ef2817cb2b26e730ec49f315daea6';

abstract class _$SelectedSubCategoryName extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ManageCategorySearchQuery)
final manageCategorySearchQueryProvider = ManageCategorySearchQueryProvider._();

final class ManageCategorySearchQueryProvider
    extends $NotifierProvider<ManageCategorySearchQuery, String> {
  ManageCategorySearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manageCategorySearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manageCategorySearchQueryHash();

  @$internal
  @override
  ManageCategorySearchQuery create() => ManageCategorySearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$manageCategorySearchQueryHash() =>
    r'd896d164a9e8c9ebad862ffe7d1fc8cae07701ab';

abstract class _$ManageCategorySearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CreateCategoryState)
final createCategoryStateProvider = CreateCategoryStateProvider._();

final class CreateCategoryStateProvider
    extends $NotifierProvider<CreateCategoryState, AsyncValue<void>> {
  CreateCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createCategoryStateHash();

  @$internal
  @override
  CreateCategoryState create() => CreateCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createCategoryStateHash() =>
    r'4a29133a32501f9adc98ff265d45c7cf4ec9d209';

abstract class _$CreateCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingCategory)
final isAddingCategoryProvider = IsAddingCategoryProvider._();

final class IsAddingCategoryProvider
    extends $NotifierProvider<IsAddingCategory, bool> {
  IsAddingCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingCategoryHash();

  @$internal
  @override
  IsAddingCategory create() => IsAddingCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingCategoryHash() => r'd1f849b9d7ea98c0a98ff22df780b28c9fd6ddb2';

abstract class _$IsAddingCategory extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedCategoryForEdit)
final selectedCategoryForEditProvider = SelectedCategoryForEditProvider._();

final class SelectedCategoryForEditProvider
    extends $NotifierProvider<SelectedCategoryForEdit, CategoryModel?> {
  SelectedCategoryForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryForEditHash();

  @$internal
  @override
  SelectedCategoryForEdit create() => SelectedCategoryForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryModel?>(value),
    );
  }
}

String _$selectedCategoryForEditHash() =>
    r'8c1d8705bf191db290aa89db25cd5394e55cac54';

abstract class _$SelectedCategoryForEdit extends $Notifier<CategoryModel?> {
  CategoryModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CategoryModel?, CategoryModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryModel?, CategoryModel?>,
              CategoryModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateCategoryState)
final updateCategoryStateProvider = UpdateCategoryStateProvider._();

final class UpdateCategoryStateProvider
    extends $NotifierProvider<UpdateCategoryState, AsyncValue<void>> {
  UpdateCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCategoryStateHash();

  @$internal
  @override
  UpdateCategoryState create() => UpdateCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateCategoryStateHash() =>
    r'e8ea78757761f2d165c5c0ceb5edecba9ba10473';

abstract class _$UpdateCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DeleteCategoryState)
final deleteCategoryStateProvider = DeleteCategoryStateProvider._();

final class DeleteCategoryStateProvider
    extends $NotifierProvider<DeleteCategoryState, AsyncValue<void>> {
  DeleteCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteCategoryStateHash();

  @$internal
  @override
  DeleteCategoryState create() => DeleteCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteCategoryStateHash() =>
    r'a1306a76b7570c52eee61961b2f2ff90fc152b23';

abstract class _$DeleteCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(categoryItemsMap)
final categoryItemsMapProvider = CategoryItemsMapProvider._();

final class CategoryItemsMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<int, List<MenuItemModel>>>,
          Map<int, List<MenuItemModel>>,
          FutureOr<Map<int, List<MenuItemModel>>>
        >
    with
        $FutureModifier<Map<int, List<MenuItemModel>>>,
        $FutureProvider<Map<int, List<MenuItemModel>>> {
  CategoryItemsMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryItemsMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryItemsMapHash();

  @$internal
  @override
  $FutureProviderElement<Map<int, List<MenuItemModel>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<int, List<MenuItemModel>>> create(Ref ref) {
    return categoryItemsMap(ref);
  }
}

String _$categoryItemsMapHash() => r'91b9e30a59287755ea80222e192f6fe9a50a022a';

@ProviderFor(categoryNameMap)
final categoryNameMapProvider = CategoryNameMapProvider._();

final class CategoryNameMapProvider
    extends
        $FunctionalProvider<
          Map<int, String>,
          Map<int, String>,
          Map<int, String>
        >
    with $Provider<Map<int, String>> {
  CategoryNameMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryNameMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryNameMapHash();

  @$internal
  @override
  $ProviderElement<Map<int, String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<int, String> create(Ref ref) {
    return categoryNameMap(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, String>>(value),
    );
  }
}

String _$categoryNameMapHash() => r'7cad7f99fa381f35a032a5301b408a493c1d67c0';

@ProviderFor(filteredManageCategories)
final filteredManageCategoriesProvider = FilteredManageCategoriesProvider._();

final class FilteredManageCategoriesProvider
    extends
        $FunctionalProvider<
          List<CategoryModel>,
          List<CategoryModel>,
          List<CategoryModel>
        >
    with $Provider<List<CategoryModel>> {
  FilteredManageCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredManageCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredManageCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<CategoryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<CategoryModel> create(Ref ref) {
    return filteredManageCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CategoryModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CategoryModel>>(value),
    );
  }
}

String _$filteredManageCategoriesHash() =>
    r'e8a432f3fcb8281e28d54df49ab42b3d8b2880e9';

@ProviderFor(subCategoryEntities)
final subCategoryEntitiesProvider = SubCategoryEntitiesProvider._();

final class SubCategoryEntitiesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubCategoryModel>>,
          List<SubCategoryModel>,
          FutureOr<List<SubCategoryModel>>
        >
    with
        $FutureModifier<List<SubCategoryModel>>,
        $FutureProvider<List<SubCategoryModel>> {
  SubCategoryEntitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryEntitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryEntitiesHash();

  @$internal
  @override
  $FutureProviderElement<List<SubCategoryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SubCategoryModel>> create(Ref ref) {
    return subCategoryEntities(ref);
  }
}

String _$subCategoryEntitiesHash() =>
    r'25a5fc9ea51d52d3ad021dce7c74436d185ea3d4';

@ProviderFor(ManageSubCategorySearchQuery)
final manageSubCategorySearchQueryProvider =
    ManageSubCategorySearchQueryProvider._();

final class ManageSubCategorySearchQueryProvider
    extends $NotifierProvider<ManageSubCategorySearchQuery, String> {
  ManageSubCategorySearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manageSubCategorySearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manageSubCategorySearchQueryHash();

  @$internal
  @override
  ManageSubCategorySearchQuery create() => ManageSubCategorySearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$manageSubCategorySearchQueryHash() =>
    r'a86ab0530712102a78aa40a0a32f9af65f2c8183';

abstract class _$ManageSubCategorySearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingSubCategory)
final isAddingSubCategoryProvider = IsAddingSubCategoryProvider._();

final class IsAddingSubCategoryProvider
    extends $NotifierProvider<IsAddingSubCategory, bool> {
  IsAddingSubCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingSubCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingSubCategoryHash();

  @$internal
  @override
  IsAddingSubCategory create() => IsAddingSubCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingSubCategoryHash() =>
    r'1463ad74d6baaee0e85e2719b43c281f52bdbf72';

abstract class _$IsAddingSubCategory extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedSubCategoryForEdit)
final selectedSubCategoryForEditProvider =
    SelectedSubCategoryForEditProvider._();

final class SelectedSubCategoryForEditProvider
    extends $NotifierProvider<SelectedSubCategoryForEdit, SubCategoryModel?> {
  SelectedSubCategoryForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedSubCategoryForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedSubCategoryForEditHash();

  @$internal
  @override
  SelectedSubCategoryForEdit create() => SelectedSubCategoryForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryModel?>(value),
    );
  }
}

String _$selectedSubCategoryForEditHash() =>
    r'7de588e4a4ed5bce5938225eb8c67c2e10049590';

abstract class _$SelectedSubCategoryForEdit
    extends $Notifier<SubCategoryModel?> {
  SubCategoryModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SubCategoryModel?, SubCategoryModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SubCategoryModel?, SubCategoryModel?>,
              SubCategoryModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CreateSubCategoryState)
final createSubCategoryStateProvider = CreateSubCategoryStateProvider._();

final class CreateSubCategoryStateProvider
    extends $NotifierProvider<CreateSubCategoryState, AsyncValue<void>> {
  CreateSubCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createSubCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createSubCategoryStateHash();

  @$internal
  @override
  CreateSubCategoryState create() => CreateSubCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createSubCategoryStateHash() =>
    r'098cc59cc5a9582f7ad8a39f9f52906de25d2d61';

abstract class _$CreateSubCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateSubCategoryState)
final updateSubCategoryStateProvider = UpdateSubCategoryStateProvider._();

final class UpdateSubCategoryStateProvider
    extends $NotifierProvider<UpdateSubCategoryState, AsyncValue<void>> {
  UpdateSubCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateSubCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateSubCategoryStateHash();

  @$internal
  @override
  UpdateSubCategoryState create() => UpdateSubCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateSubCategoryStateHash() =>
    r'b5df6fe3acc227595c21bc3ee0e7c81d18461934';

abstract class _$UpdateSubCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DeleteSubCategoryState)
final deleteSubCategoryStateProvider = DeleteSubCategoryStateProvider._();

final class DeleteSubCategoryStateProvider
    extends $NotifierProvider<DeleteSubCategoryState, AsyncValue<void>> {
  DeleteSubCategoryStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteSubCategoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteSubCategoryStateHash();

  @$internal
  @override
  DeleteSubCategoryState create() => DeleteSubCategoryState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteSubCategoryStateHash() =>
    r'097771871d6c0ec37c66f189ced770dd0c91570a';

abstract class _$DeleteSubCategoryState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredManageSubCategories)
final filteredManageSubCategoriesProvider =
    FilteredManageSubCategoriesProvider._();

final class FilteredManageSubCategoriesProvider
    extends
        $FunctionalProvider<
          List<SubCategoryModel>,
          List<SubCategoryModel>,
          List<SubCategoryModel>
        >
    with $Provider<List<SubCategoryModel>> {
  FilteredManageSubCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredManageSubCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredManageSubCategoriesHash();

  @$internal
  @override
  $ProviderElement<List<SubCategoryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SubCategoryModel> create(Ref ref) {
    return filteredManageSubCategories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SubCategoryModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SubCategoryModel>>(value),
    );
  }
}

String _$filteredManageSubCategoriesHash() =>
    r'8189502a555709819cd58f2ec3e3f6a5be8a7421';

@ProviderFor(products)
final productsProvider = ProductsProvider._();

final class ProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductModel>>,
          List<ProductModel>,
          FutureOr<List<ProductModel>>
        >
    with
        $FutureModifier<List<ProductModel>>,
        $FutureProvider<List<ProductModel>> {
  ProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsHash();

  @$internal
  @override
  $FutureProviderElement<List<ProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductModel>> create(Ref ref) {
    return products(ref);
  }
}

String _$productsHash() => r'3b45612c8c1aa5a74cf4b9a55fe20d59b4d187b3';

@ProviderFor(ManageProductSearchQuery)
final manageProductSearchQueryProvider = ManageProductSearchQueryProvider._();

final class ManageProductSearchQueryProvider
    extends $NotifierProvider<ManageProductSearchQuery, String> {
  ManageProductSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manageProductSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manageProductSearchQueryHash();

  @$internal
  @override
  ManageProductSearchQuery create() => ManageProductSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$manageProductSearchQueryHash() =>
    r'3fdb2e76ae2cddb2be54a53a1dc09fbade05f2c3';

abstract class _$ManageProductSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedProductForEdit)
final selectedProductForEditProvider = SelectedProductForEditProvider._();

final class SelectedProductForEditProvider
    extends $NotifierProvider<SelectedProductForEdit, ProductModel?> {
  SelectedProductForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedProductForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedProductForEditHash();

  @$internal
  @override
  SelectedProductForEdit create() => SelectedProductForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductModel?>(value),
    );
  }
}

String _$selectedProductForEditHash() =>
    r'93c6f08b15616aa91405dec39eb661e3105e512a';

abstract class _$SelectedProductForEdit extends $Notifier<ProductModel?> {
  ProductModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductModel?, ProductModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductModel?, ProductModel?>,
              ProductModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingProduct)
final isAddingProductProvider = IsAddingProductProvider._();

final class IsAddingProductProvider
    extends $NotifierProvider<IsAddingProduct, bool> {
  IsAddingProductProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingProductHash();

  @$internal
  @override
  IsAddingProduct create() => IsAddingProduct();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingProductHash() => r'a7aa50d76a654dd576ed8b4da08bead1523c001b';

abstract class _$IsAddingProduct extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CreateProductState)
final createProductStateProvider = CreateProductStateProvider._();

final class CreateProductStateProvider
    extends $NotifierProvider<CreateProductState, AsyncValue<void>> {
  CreateProductStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createProductStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createProductStateHash();

  @$internal
  @override
  CreateProductState create() => CreateProductState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createProductStateHash() =>
    r'62c2452c341a1f8bc72ca3bb03bbb968702a0def';

abstract class _$CreateProductState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateProductState)
final updateProductStateProvider = UpdateProductStateProvider._();

final class UpdateProductStateProvider
    extends $NotifierProvider<UpdateProductState, AsyncValue<void>> {
  UpdateProductStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateProductStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateProductStateHash();

  @$internal
  @override
  UpdateProductState create() => UpdateProductState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateProductStateHash() =>
    r'ed71e78ec01ad9d044a9519d9d1b45698f362b5a';

abstract class _$UpdateProductState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DeleteProductState)
final deleteProductStateProvider = DeleteProductStateProvider._();

final class DeleteProductStateProvider
    extends $NotifierProvider<DeleteProductState, AsyncValue<void>> {
  DeleteProductStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteProductStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteProductStateHash();

  @$internal
  @override
  DeleteProductState create() => DeleteProductState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteProductStateHash() =>
    r'c14b0bd45e2992e92820138251cf0afa61bd944a';

abstract class _$DeleteProductState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredManageProducts)
final filteredManageProductsProvider = FilteredManageProductsProvider._();

final class FilteredManageProductsProvider
    extends
        $FunctionalProvider<
          List<ProductModel>,
          List<ProductModel>,
          List<ProductModel>
        >
    with $Provider<List<ProductModel>> {
  FilteredManageProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredManageProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredManageProductsHash();

  @$internal
  @override
  $ProviderElement<List<ProductModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProductModel> create(Ref ref) {
    return filteredManageProducts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProductModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProductModel>>(value),
    );
  }
}

String _$filteredManageProductsHash() =>
    r'0095d3ab952e51b46e25f9f779af5debf357074c';
