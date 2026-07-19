# Walkthrough - New Top Selling Product Report

I have added a new "Top Selling Product Report" to the Reports module. This report allows users to see which products are performing best based on quantity and sales volume, with flexible filtering options.

## Changes Made

### Core Network

#### [api_constants.dart](file:///D:/StudioProjects/nextrestro/lib/core/network/api_constants.dart)
- Added the `getTopSellingProductsReportEndpoint` constant pointing to `/api/reports/topsellingproducts`.

### Reports Module - Data Layer

#### [top_selling_products_report_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/models/top_selling_products_report_model.dart)
- Created a new model using `freezed` and `json_serializable` to handle the request and response for top-selling products.
- Includes `quantity`, `totalSales`, and `averagePrice` for each product.

#### [reports_remote_data_source.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/data_sources/reports_remote_data_source.dart)
- Added `getTopSellingProductsReport` to fetch data from the API.

#### [reports_repository.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/domain/repositories/reports_repository.dart) & [reports_repository_impl.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/repositories/reports_repository_impl.dart)
- Updated the domain repository and its implementation to include the new report method.

### Reports Module - Presentation Layer

#### [reports_controller.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/providers/reports_controller.dart)
- Added `TopSellingProductsReportController` to manage the state and fetching of the top-selling products report.

#### [top_selling_products_report_content.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/widgets/top_selling_products_report_content.dart)
- Developed a comprehensive UI for the report, featuring:
    - **Filters**: Date range (From/To), Fiscal Year, Branch, Category, Product, and "Top N" (5, 10, 20, 50, 100).
    - **Search**: Real-time filtering of fetched results.
    - **Data Table**: Displays SN, Product Name, Category, Qty Sold, Avg. Price, and Total Sales.
    - **Summary Footer**: Shows total quantities and amounts.

#### [reports_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/landscape/reports_landscape_page.dart) & [reports_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/portrait/reports_portrait_page.dart)
- Integrated the new report as the 7th tab in both landscape and portrait orientations.

## Code Generation
- Successfully ran `build_runner` to generate all `.freezed.dart` and `.g.dart` files.

## Verification Results

### Manual Verification
- Navigated to **Reports > Top Selling Product Report**.
- Verified that **All Categories** and **All Products** (ID 0) are selected by default.
- Verified that **Fiscal Year** and **Branch** default to the first items in their respective lists.
- Confirmed that data is correctly displayed in the table after clicking **Search**.
- Verified that the layout adapts correctly between **Landscape** (sidebar) and **Portrait** (bottom nav).
