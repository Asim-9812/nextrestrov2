import 'dart:io';

import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/sub_category_model.dart';

abstract class MenuRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<MenuItemModel>> getMenuItemsByCategory(int categoryId);
  Future<List<MenuItemModel>> searchMenu(String query);
  Future<void> createCategory(String name, String description);
  Future<void> updateCategory(int categoryId, String name, String description);
  Future<void> deleteCategory(int categoryId);

  // SubCategory Methods
  Future<List<SubCategoryModel>> getSubCategories();
  Future<void> createSubCategory(int categoryId, String name);
  Future<void> updateSubCategory(int subCategoryId, int categoryId, String name);
  Future<void> deleteSubCategory(int subCategoryId);
  
  // Product Methods
  Future<List<ProductModel>> getProducts();
  Future<void> createProduct(ProductModel product, {File? image});
  Future<void> updateProduct(ProductModel product, {File? image});
  Future<void> deleteProduct(int productId);
}
