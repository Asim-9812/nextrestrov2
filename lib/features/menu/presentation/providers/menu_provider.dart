import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/sub_category_model.dart';
import '../../data/repositories/menu_repository_impl.dart';

part 'menu_provider.g.dart';

@riverpod
class SelectedMenuTab extends _$SelectedMenuTab {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

@riverpod
class CategoryExpanded extends _$CategoryExpanded {
  @override
  bool build() => false;

  void toggle() => state = !state;
  void set(bool expanded) => state = expanded;
}

@riverpod
class ProductExpanded extends _$ProductExpanded {
  @override
  bool build() => false;

  void toggle() => state = !state;
  void set(bool expanded) => state = expanded;
}

@riverpod
class MenuSearchQuery extends _$MenuSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
Future<List<CategoryModel>> categories(Ref ref) async {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getCategories();
}

@riverpod
class SelectedCategoryId extends _$SelectedCategoryId {
  @override
  int? build() => null;

  void set(int? id) => state = id;
}

@riverpod
class SelectedSubCategoryId extends _$SelectedSubCategoryId {
  @override
  int? build() => null; // null means All

  void set(int? id) => state = id;
}

@riverpod
Future<List<MenuItemModel>> menuItems(Ref ref) async {
  final categoryId = ref.watch(selectedCategoryIdProvider);
  final searchQuery = ref.watch(menuSearchQueryProvider);
  final repository = ref.watch(menuRepositoryProvider);

  if (searchQuery.isNotEmpty) {
    return repository.searchMenu(searchQuery);
  }

  if (categoryId == null) {
    // If no category selected, maybe fetch first category's items or return empty
    final categoriesAsync = await ref.watch(categoriesProvider.future);
    if (categoriesAsync.isNotEmpty) {
      // Don't set state here, just use it for the first fetch
      return repository.getMenuItemsByCategory(categoriesAsync.first.categoryId);
    }
    return [];
  }

  return repository.getMenuItemsByCategory(categoryId);
}

@riverpod
List<String> subCategories(Ref ref) {
  final itemsAsync = ref.watch(menuItemsProvider);
  return itemsAsync.maybeWhen(
    data: (items) {
      final subs = items.map((e) => e.subCategoryName).toSet().toList();
      subs.sort();
      return ['All', ...subs];
    },
    orElse: () => ['All'],
  );
}

@riverpod
List<MenuItemModel> filteredMenuItems(Ref ref) {
  final itemsAsync = ref.watch(menuItemsProvider);
  final selectedSub = ref.watch(selectedSubCategoryIdProvider); // Using int as ID or just String for name?
  // Actually the item model has subCategoryName and subCategoryID.
  // The user said: "group them on the subcategory basis on the list making a sub tab below category tab with all as default then the sub categories and filter the menu items on that basis"
  
  // Let's use String for subcategory name in filter for simplicity if we don't have subcategory list API.
  
  return itemsAsync.maybeWhen(
    data: (items) {
      final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
      if (selectedSubName == 'All') return items;
      return items.where((item) => item.subCategoryName == selectedSubName).toList();
    },
    orElse: () => [],
  );
}

@riverpod
class SelectedSubCategoryName extends _$SelectedSubCategoryName {
  @override
  String build() => 'All';

  void set(String name) => state = name;
}

@riverpod
class ManageCategorySearchQuery extends _$ManageCategorySearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
class CreateCategoryState extends _$CreateCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createCategory(String name, String description) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.createCategory(name, description);
      ref.invalidate(categoriesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class IsAddingCategory extends _$IsAddingCategory {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class SelectedCategoryForEdit extends _$SelectedCategoryForEdit {
  @override
  CategoryModel? build() => null;

  void select(CategoryModel? category) => state = category;
}

@riverpod
class UpdateCategoryState extends _$UpdateCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateCategory(int categoryId, String name, String description) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.updateCategory(categoryId, name, description);
      ref.invalidate(categoriesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteCategoryState extends _$DeleteCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteCategory(int categoryId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteCategory(categoryId);
      ref.invalidate(categoriesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
Future<Map<int, List<MenuItemModel>>> categoryItemsMap(Ref ref) async {
  final categoriesAsync = await ref.watch(categoriesProvider.future);
  final repository = ref.watch(menuRepositoryProvider);
  
  final map = <int, List<MenuItemModel>>{};
  for (final cat in categoriesAsync) {
    try {
      final items = await repository.getMenuItemsByCategory(cat.categoryId);
      map[cat.categoryId] = items;
    } catch (_) {
      map[cat.categoryId] = [];
    }
  }
  return map;
}

@riverpod
Map<int, String> categoryNameMap(Ref ref) {
  final categoriesAsync = ref.watch(categoriesProvider);
  return categoriesAsync.maybeWhen(
    data: (categories) => {for (final c in categories) c.categoryId: c.categoryName},
    orElse: () => {},
  );
}

@riverpod
List<CategoryModel> filteredManageCategories(Ref ref) {
  final categoriesAsync = ref.watch(categoriesProvider);
  final search = ref.watch(manageCategorySearchQueryProvider).toLowerCase();

  return categoriesAsync.maybeWhen(
    data: (categories) {
      return categories.where((cat) {
        return cat.categoryName.toLowerCase().contains(search);
      }).toList();
    },
    orElse: () => [],
  );
}

// SubCategory Providers
@riverpod
Future<List<SubCategoryModel>> subCategoryEntities(Ref ref) async {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getSubCategories();
}

@riverpod
class ManageSubCategorySearchQuery extends _$ManageSubCategorySearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
class IsAddingSubCategory extends _$IsAddingSubCategory {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class SelectedSubCategoryForEdit extends _$SelectedSubCategoryForEdit {
  @override
  SubCategoryModel? build() => null;

  void select(SubCategoryModel? subCategory) => state = subCategory;
}

@riverpod
class CreateSubCategoryState extends _$CreateSubCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createSubCategory(int categoryId, String name) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.createSubCategory(categoryId, name);
      ref.invalidate(subCategoryEntitiesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class UpdateSubCategoryState extends _$UpdateSubCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateSubCategory(int subCategoryId, int categoryId, String name) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.updateSubCategory(subCategoryId, categoryId, name);
      ref.invalidate(subCategoryEntitiesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteSubCategoryState extends _$DeleteSubCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteSubCategory(int subCategoryId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteSubCategory(subCategoryId);
      ref.invalidate(subCategoryEntitiesProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
List<SubCategoryModel> filteredManageSubCategories(Ref ref) {
  final subCategoriesAsync = ref.watch(subCategoryEntitiesProvider);
  final search = ref.watch(manageSubCategorySearchQueryProvider).toLowerCase();

  return subCategoriesAsync.maybeWhen(
    data: (subCategories) {
      return subCategories.where((sub) {
        return sub.subCategoryName.toLowerCase().contains(search);
      }).toList();
    },
    orElse: () => [],
  );
}

// Product Providers
@riverpod
Future<List<ProductModel>> products(Ref ref) async {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getProducts();
}

@riverpod
class ManageProductSearchQuery extends _$ManageProductSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@Riverpod(keepAlive: true)
class SelectedProductForEdit extends _$SelectedProductForEdit {
  @override
  ProductModel? build() => null;

  void select(ProductModel? product) => state = product;
}

@riverpod
class IsAddingProduct extends _$IsAddingProduct {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@riverpod
class CreateProductState extends _$CreateProductState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createProduct(ProductModel product) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.createProduct(product);
      ref.invalidate(productsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class UpdateProductState extends _$UpdateProductState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateProduct(ProductModel product) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.updateProduct(product);
      ref.invalidate(productsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteProductState extends _$DeleteCategoryState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteProduct(int productId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteProduct(productId);
      ref.invalidate(productsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
List<ProductModel> filteredManageProducts(Ref ref) {
  final productsAsync = ref.watch(productsProvider);
  final search = ref.watch(manageProductSearchQueryProvider).toLowerCase();

  return productsAsync.maybeWhen(
    data: (products) {
      return products.where((p) {
        return p.productName.toLowerCase().contains(search);
      }).toList();
    },
    orElse: () => [],
  );
}
