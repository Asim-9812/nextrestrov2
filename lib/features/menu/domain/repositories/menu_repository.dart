
import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';
import '../../data/models/product_model.dart';

abstract class MenuRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<MenuItemModel>> getMenuItemsByCategory(int categoryId);
  Future<List<MenuItemModel>> searchMenu(String query);
  Future<void> createCategory(String name, String description);
  Future<void> updateCategory(int categoryId, String name, String description);
  Future<void> deleteCategory(int categoryId);
  
  // Product Methods
  Future<List<ProductModel>> getProducts();
  Future<void> createProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(int productId);
}
