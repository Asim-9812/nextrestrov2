# Implementation Plan - New Modules and Sales Report

This plan outlines the integration of four new modules: `FiscalYear`, `PrefixSuffix`, `VoucherType`, and `SalesReport`. While the first three will focus on data layer and internal logic, the `SalesReport` will have a full UI integrated into the Admin Dashboard.

## Proposed Changes

### [Data Layer] New Modules Models and Repositories

#### [NEW] [fiscal_year_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/fiscal_year/data/models/fiscal_year_model.dart)
- Define `FiscalYearModel` and `FiscalYearResponse` using Freezed.

#### [NEW] [prefix_suffix_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/prefix_suffix/data/models/prefix_suffix_model.dart)
- Define `PrefixSuffixModel` and `PrefixSuffixResponse`.

#### [NEW] [voucher_type_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/voucher_type/data/models/voucher_type_model.dart)
- Define `VoucherTypeModel` and `VoucherTypeResponse`.

#### [NEW] [sales_report_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/models/sales_report_model.dart)
- Define `SalesReportRequest`, `SalesReportResponse`, `SalesReportSummary`, and `SalesInvoiceData`.

#### [NEW] Repositories and Data Sources
- Create `RemoteDataSource` and `RepositoryImpl` for all four modules following the existing clean architecture pattern.
- Implement the `GET` methods for `FiscalYear`, `PrefixSuffix`, and `VoucherType`.
- Implement the `POST` method for `SalesReport`.

---

### [Reports Feature] Presentation Layer

#### [NEW] [reports_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/pages/reports_page.dart)
- Main entry point that switches between Landscape and Portrait layouts.

#### [NEW] [reports_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/landscape/reports_landscape_page.dart)
- Two-column layout:
    - Left: Sub-menu sidebar (listing "Sales Report").
    - Right: Content area for the selected report.

#### [NEW] [sales_report_content.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/widgets/sales_report_content.dart)
- UI for the sales report including:
    - Search filters: From/To Date pickers and Fiscal Year dropdown.
    - Summary cards: Total Bills, SubTotal, Discount, Tax, Grand Total, Total Items.
    - Data Table: List of billing records.

---

### [Admin Dashboard] Integration

#### [admin_sidebar.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/landscape/widgets/admin_sidebar.dart)
- Add "Reports" to the sidebar menu.

#### [admin_dashboard_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/landscape/admin_dashboard_landscape_page.dart)
- Add `ReportsPage` to the `IndexedStack` and update page titles/indexing.

#### [admin_dashboard_potrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/potrait/admin_dashboard_potrait_page.dart)
- Add "Reports" to the drawer and `IndexedStack`.

## Verification Plan

### Automated Tests
- I'll check if I can add some unit tests for the new models to ensure JSON serialization works correctly.
- `flutter test lib/features/reports/data/models/sales_report_model_test.dart`

### Manual Verification
- Navigate to the "Reports" section from the Admin Dashboard (both Landscape and Portrait).
- Verify the sub-menu in Landscape mode.
- Change date range and Fiscal Year, then click "Search" to verify the API call (via logs).
- Check if the summary cards and the table display data correctly from the mock/real API response.
- Verify error handling if the API fails.
