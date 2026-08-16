class ApiEndpoints {
  static const String baseUrl = "https://pets.codeinfinitynepal.com"; // Replace with actual base URL
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;

  // Auth
  static const String login = "/api/Auth/login";
  static const String register = "/api/Auth/register";
  static const String forgotPassword = "/api/Auth/forgotpassword";
  static const String resetPassword = "/api/Auth/reset-password";
  static const String resendOtp = "/api/Auth/resend-otp";
  static const String getAllUsers = "/api/Auth/getallusers";
  static const String getUserById = "/api/Auth/getuserbyId";
  static const String profile = "/api/Auth/profile";

  // Branch
  static const String saveBranch = "/api/Branch/save";
  static const String updateBranch = "/api/Branch/update";
  static const String deleteBranch = "/api/Branch/delete";
  static const String getBranchById = "/api/Branch/getbyid";
  static const String getAllBranches = "/api/Branch/getall";
  static const String changeBranchStatus = "/api/Branch/changestatus";

  // Brand
  static const String saveBrand = "/api/Brand/save";
  static const String updateBrand = "/api/Brand/update";
  static const String deleteBrand = "/api/Brand/delete";
  static const String getBrandById = "/api/Brand/getbyid";
  static const String getAllBrands = "/api/Brand/getall";
  static const String changeBrandStatus = "/api/Brand/changestatus";

  // Cart
  static const String addToCart = "/api/Cart/add";
  static const String updateCartQuantity = "/api/Cart/updatequantity";
  static const String removeFromCart = "/api/Cart/removeitem";
  static const String getCart = "/api/Cart/get";
  static const String clearCart = "/api/Cart/clear";
  static const String checkout = "/api/Cart/checkout";

  // Category
  static const String saveCategory = "/api/Category/save";
  static const String updateCategory = "/api/Category/update";
  static const String deleteCategory = "/api/Category/delete";
  static const String getCategoryById = "/api/Category/getbyid";
  static const String getAllCategories = "/api/Category/getall";
  static const String changeCategoryStatus = "/api/Category/changestatus";

  // Company
  static const String company = "/api/Company";
  static String getCompanyById(int id) => "/api/Company/$id";

  // Fiscal Year
  static const String fiscalYear = "/api/FiscalYear";
  static String getFiscalYearById(int id) => "/api/FiscalYear/$id";
  static String changeFiscalYearStatus(int id) => "/api/FiscalYear/ChangeStatus/$id";
  static String closeFiscalYearBook(int id) => "/api/FiscalYear/BookClose/$id";

  // Pet Type
  static const String savePetType = "/api/PetType/save";
  static const String updatePetType = "/api/PetType/update";
  static const String deletePetType = "/api/PetType/delete";
  static const String getPetTypeById = "/api/PetType/getbyid";
  static const String getAllPetTypes = "/api/PetType/getall";
  static const String changePetTypeStatus = "/api/PetType/changestatus";

  // Prefix Suffix
  static const String savePrefixSuffix = "/api/PrefixSuffix/save";
  static const String updatePrefixSuffix = "/api/PrefixSuffix/update";
  static const String deletePrefixSuffix = "/api/PrefixSuffix/delete";
  static const String getPrefixSuffixById = "/api/PrefixSuffix/getbyid";
  static const String getAllPrefixSuffixes = "/api/PrefixSuffix/getall";
  static const String changePrefixSuffixStatus = "/api/PrefixSuffix/changestatus";
  static const String getNextVoucherNumber = "/api/PrefixSuffix/getnextvouchernumber";

  // Product
  static const String saveProduct = "/api/Product/save";
  static const String updateProduct = "/api/Product/update";
  static const String getProductById = "/api/Product/getbyid";
  static const String getAllProducts = "/api/Product/getall";
  static const String changeProductStatus = "/api/Product/changestatus";
  static const String getEcommerceProducts = "/api/Product/getecommerceproducts";

  // Product Batch
  static const String saveProductBatch = "/api/ProductBatch/save";
  static const String updateProductBatch = "/api/ProductBatch/update";
  static const String getProductBatchById = "/api/ProductBatch/getbyid";
  static const String getAllProductBatches = "/api/ProductBatch/getall";
  static const String changeProductBatchStatus = "/api/ProductBatch/changestatus";

  // Product Type
  static const String saveProductType = "/api/ProductType/save";
  static const String updateProductType = "/api/ProductType/update";
  static const String deleteProductType = "/api/ProductType/delete";
  static const String getProductTypeById = "/api/ProductType/getbyid";
  static const String getAllProductTypes = "/api/ProductType/getall";
  static const String changeProductTypeStatus = "/api/ProductType/changestatus";

  // Unit
  static const String saveUnit = "/api/Unit/save";
  static const String updateUnit = "/api/Unit/update";
  static const String deleteUnit = "/api/Unit/delete";
  static const String getUnitById = "/api/Unit/getbyid";
  static const String getAllUnits = "/api/Unit/getall";
  static const String changeUnitStatus = "/api/Unit/changestatus";

  // Order
  static const String getAllOrders = "/api/Order/getall";
}
