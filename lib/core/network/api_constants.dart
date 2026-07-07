class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://tbfhh-103-1-93-10.free.pinggy.net';

  // Timeouts (in milliseconds)
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // Endpoints - Auth
  static const String loginEndpoint = '/api/Auth/login';
  static const String registerEndpoint = '/api/Auth/register';
  static const String forgotPasswordEndpoint = '/api/Auth/forgotpassword';
  static const String resetPasswordEndpoint = '/api/Auth/reset-password';
  static const String resendOtpEndpoint = '/api/Auth/resend-otp';
  static const String getAllUsersEndpoint = '/api/Auth/getallusers';
  static const String getUserByIdEndpoint = '/api/Auth/getuserbyId';

  // Endpoints - Branch
  static const String getBranchByCompanyEndpoint = '/api/Branch/:companyId';
  static const String getBranchDetailEndpoint = '/api/Branch/detail/:id';
  static const String getBranchByIdEndpoint = '/api/Branch/:id';
  static const String createBranchEndpoint = '/api/Branch';
  static const String updateBranchEndpoint = '/api/Branch/:id';
  static const String deleteBranchEndpoint = '/api/Branch/:id';

  // Endpoints - Category
  static const String createCategoryEndpoint = '/api/Category';
  static const String getCategoriesEndpoint = '/api/Category';
  static const String updateCategoryEndpoint = '/api/Category';
  static const String deleteCategoryEndpoint = '/api/Category/:id';

  // Endpoints - Company
  static const String getCompanyByIdEndpoint = '/api/Company/:id';
  static const String createCompanyEndpoint = '/api/Company';
  static const String getCompaniesEndpoint = '/api/Company';
  static const String updateCompanyEndpoint = '/api/Company/:id';
  static const String deleteCompanyEndpoint = '/api/Company/:id';

  // Endpoints - Customer
  static const String getCustomerByIdEndpoint = '/api/Customer/:id';
  static const String createCustomerEndpoint = '/api/Customer';
  static const String getCustomersEndpoint = '/api/Customer';
  static const String updateCustomerEndpoint = '/api/Customer';
  static const String deleteCustomerEndpoint = '/api/Customer/:id';

  // Endpoints - Dashboard
  static const String getDashboardSummaryEndpoint = '/api/Dashboard/summary';

  // Endpoints - Department
  static const String getDepartmentByIdEndpoint = '/api/Department/:id';
  static const String createDepartmentEndpoint = '/api/Department';
  static const String getDepartmentsEndpoint = '/api/Department';
  static const String updateDepartmentEndpoint = '/api/Department';
  static const String deleteDepartmentEndpoint = '/api/Department/:id';

  // Endpoints - Menu
  static const String getMenuCategoryEndpoint = '/api/Menu/category/:id';
  static const String getMenuSubcategoryEndpoint = '/api/Menu/subcategory/:id';
  static const String searchMenuEndpoint = '/api/Menu/search';
  static const String getMenusEndpoint = '/api/Menu';

  // Endpoints - Order
  static const String createOrderEndpoint = '/api/Order/Create';
  static const String updateOrderStatusEndpoint = '/api/Order/UpdateStatus';
  static const String updateOrderItemStatusEndpoint = '/api/Order/UpdateItemStatus';
  static const String getOrderDetailsEndpoint = '/api/Order/GetOrderDetails';
  static const String orderCheckoutEndpoint = '/api/Order/checkout';
  static const String getOrderPreviewEndpoint = '/api/Order/preview/:orderId';
  static const String getOrderByIdEndpoint = '/api/Order/GetOrderById/:orderId';
  static const String payAtTableEndpoint = '/api/Order/payat-table/:qrToken';

  // Endpoints - Payment Session
  static const String createPaymentSessionEndpoint = '/api/PaymentSession/create-session';

  // Endpoints - Product
  static const String createProductEndpoint = '/api/Product';
  static const String getProductsEndpoint = '/api/Product';
  static const String updateProductEndpoint = '/api/Product';
  static const String deleteProductEndpoint = '/api/Product/:id';

  // Endpoints - Reservation
  static const String createReservationEndpoint = '/api/Reservation/createreservation';
  static const String getAllReservationsEndpoint = '/api/Reservation/getallreserve';
  static const String getReservationDetailsEndpoint = '/api/Reservation/get-details/:reservationId';
  static const String cancelReservationEndpoint = '/api/Reservation/cancel-detail';

  // Endpoints - Shift
  static const String openShiftEndpoint = '/api/Shift/open-shift';
  static const String getAllShiftsEndpoint = '/api/Shift/get-all';
  static const String closeShiftEndpoint = '/api/Shift/close-shift';

  // Endpoints - SubCategory
  static const String createSubCategoryEndpoint = '/api/SubCategory';
  static const String getSubCategoriesEndpoint = '/api/SubCategory';
  static const String updateSubCategoryEndpoint = '/api/SubCategory';
  static const String deleteSubCategoryEndpoint = '/api/SubCategory/:id';

  // Endpoints - Table
  static const String getTableByIdEndpoint = '/api/Table/:id';
  static const String createTableEndpoint = '/api/Table';
  static const String getTablesEndpoint = '/api/Table';
  static const String updateTableEndpoint = '/api/Table/:id';
  static const String deleteTableEndpoint = '/api/Table/:id';
  static const String changeTableEndpoint = '/api/Table/change-table';
}
