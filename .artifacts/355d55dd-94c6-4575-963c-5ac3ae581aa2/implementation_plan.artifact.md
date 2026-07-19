# Add Top Selling Product Report

This plan outlines the steps to add a new "Top Selling Product Report" to the Reports module.

## User Review Required

> [!IMPORTANT]
> The new report will be added as a 7th tab in the Reports module.
> I will assume the response structure for `topsellingproducts` follows the pattern of other reports in the project (having a `summary` and a `data` list).

## Proposed Changes

### Core Network

#### [MODIFY] [api_constants.dart](file:///D:/StudioProjects/nextrestro/lib/core/network/api_constants.dart)
- Add `getTopSellingProductsReportEndpoint = '/api/reports/topsellingproducts'`.

### Reports Module - Data Layer

#### [NEW] [top_selling_products_report_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/models/top_selling_products_report_model.dart)
- Define `TopSellingProductsReportRequest`, `TopSellingProductsReportResponse`, `TopSellingProductsReportData`, `TopSellingProductsReportSummary`, and `TopSellingProductData`.

#### [MODIFY] [reports_remote_data_source.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/data_sources/reports_remote_data_source.dart)
- Add `getTopSellingProductsReport(TopSellingProductsReportRequest request)`.

#### [MODIFY] [reports_repository.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/domain/repositories/reports_repository.dart)
- Add `getTopSellingProductsReport` interface.

#### [MODIFY] [reports_repository_impl.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/repositories/reports_repository_impl.dart)
- Implement `getTopSellingProductsReport`.

### Reports Module - Presentation Layer

#### [MODIFY] [reports_controller.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/providers/reports_controller.dart)
- Add `TopSellingProductsReportController` (Riverpod class).

#### [NEW] [top_selling_products_report_content.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/widgets/top_selling_products_report_content.dart)
- Create the UI widget for the report with filters (Date Range, Fiscal Year, Branch, Category, Product, Top N) and a data table.

#### [MODIFY] [reports_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/landscape/reports_landscape_page.dart)
- Add "Top Selling Product Report" to the sidebar.
- Map the new index to `TopSellingProductsReportContent`.

#### [MODIFY] [reports_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/portrait/reports_portrait_page.dart)
- Add "Top Selling" to the bottom navigation bar.
- Map the new index to `TopSellingProductsReportContent(isPortrait: true)`.

## Verification Plan

### Manual Verification
- Navigate to the Reports module.
- Select "Top Selling Product Report".
- Verify all filters (Branch, Fiscal Year, Category, Product, Top N) are working and have correct defaults.
- Click "Search" and verify data is fetched and displayed correctly.
- Verify summary cards at the bottom.
- Test in both Landscape and Portrait modes.
