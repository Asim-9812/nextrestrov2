import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import '../../domain/repositories/menu_repository.dart';
import '../models/category_model.dart';
import '../models/menu_item_model.dart';
import '../models/product_model.dart';
import '../models/sub_category_model.dart';

final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MenuRepositoryImpl(apiClient);
});

class MenuRepositoryImpl implements MenuRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  MenuRepositoryImpl(this._apiClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      _logger.i('Fetching categories');
      final response = await _apiClient.get(ApiConstants.getCategoriesEndpoint);
      if (response.data is List) {
        return (response.data as List)
            .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch categories', error: e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemModel>> getMenuItemsByCategory(int categoryId) async {
    try {
      _logger.i('Fetching menu items for category $categoryId');
      final endpoint = ApiConstants.getMenuCategoryEndpoint.replaceFirst(':id', categoryId.toString());
      final response = await _apiClient.get(endpoint);
      if (response.data is List) {
        return (response.data as List)
            .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch menu items for category $categoryId', error: e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemModel>> searchMenu(String query) async {
    try {
      _logger.i('Searching menu with query: $query');
      final response = await _apiClient.get(
        ApiConstants.searchMenuEndpoint,
        queryParameters: {'keyword': query},
      );
      if (response.data is List) {
        return (response.data as List)
            .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      _logger.e('Failed to search menu', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createCategory(String name, String description) async {
    try {
      _logger.i('Creating category: $name');
      await _apiClient.post(
        ApiConstants.createCategoryEndpoint,
        data: {
          'categoryId': 0, // Server usually generates this
          'categoryName': name,
          'description': description,
        },
      );
      _logger.i('Category creation successful');
    } catch (e) {
      _logger.e('Failed to create category', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateCategory(int categoryId, String name, String description) async {
    try {
      _logger.i('Updating category: $categoryId');
      await _apiClient.put(
        ApiConstants.updateCategoryEndpoint,
        data: {
          'categoryId': categoryId,
          'categoryName': name,
          'description': description,
        },
      );
      _logger.i('Category update successful');
    } catch (e) {
      _logger.e('Failed to update category', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    try {
      _logger.i('Deleting category: $categoryId');
      final endpoint = ApiConstants.deleteCategoryEndpoint.replaceFirst(':id', categoryId.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Category deletion successful');
    } catch (e) {
      _logger.e('Failed to delete category', error: e);
      rethrow;
    }
  }

  @override
  Future<List<SubCategoryModel>> getSubCategories() async {
    try {
      _logger.i('Fetching subcategories');
      final response = await _apiClient.get(ApiConstants.getSubCategoriesEndpoint);
      if (response.data != null) {
        final subCategoryResponse = SubCategoryResponse.fromJson(response.data as Map<String, dynamic>);
        return subCategoryResponse.data;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch subcategories', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createSubCategory(int categoryId, String name) async {
    try {
      _logger.i('Creating subcategory: $name for category $categoryId');
      await _apiClient.post(
        ApiConstants.createSubCategoryEndpoint,
        data: {
          'subCategoryId': 0,
          'categoryId': categoryId,
          'subCategoryName': name,
        },
      );
      _logger.i('Subcategory creation successful');
    } catch (e) {
      _logger.e('Failed to create subcategory', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateSubCategory(int subCategoryId, int categoryId, String name) async {
    try {
      _logger.i('Updating subcategory: $subCategoryId');
      await _apiClient.put(
        ApiConstants.updateSubCategoryEndpoint,
        data: {
          'subCategoryId': subCategoryId,
          'categoryId': categoryId,
          'subCategoryName': name,
        },
      );
      _logger.i('Subcategory update successful');
    } catch (e) {
      _logger.e('Failed to update subcategory', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteSubCategory(int subCategoryId) async {
    try {
      _logger.i('Deleting subcategory: $subCategoryId');
      final endpoint = ApiConstants.deleteSubCategoryEndpoint.replaceFirst(':id', subCategoryId.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Subcategory deletion successful');
    } catch (e) {
      _logger.e('Failed to delete subcategory', error: e);
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      _logger.i('Fetching products');
      final response = await _apiClient.get(ApiConstants.getProductsEndpoint);
      if (response.data is List) {
        return (response.data as List)
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch products', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createProduct(ProductModel product) async {
    try {
      _logger.i('Creating product: ${product.productName}');
      await _apiClient.post(
        ApiConstants.createProductEndpoint,
        data: product.toJson(),
      );
      _logger.i('Product creation successful');
    } catch (e) {
      _logger.e('Failed to create product', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    try {
      _logger.i('Updating product: ${product.productId}');
      await _apiClient.put(
        ApiConstants.updateProductEndpoint,
        data: product.toJson(),
      );
      _logger.i('Product update successful');
    } catch (e) {
      _logger.e('Failed to update product', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct(int productId) async {
    try {
      _logger.i('Deleting product: $productId');
      final endpoint = ApiConstants.deleteProductEndpoint.replaceFirst(':id', productId.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Product deletion successful');
    } catch (e) {
      _logger.e('Failed to delete product', error: e);
      rethrow;
    }
  }
}
