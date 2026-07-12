# Implementation Plan - User Sales Report

Add a new User Sales Report feature to track sales performance per user, including API integration, data modeling, and UI implementation.

## Proposed Changes

### [Core Network]

#### [api_constants.dart](file:///D:/StudioProjects/nextrestro/lib/core/network/api_constants.dart)
- Add `getUserSalesReportEndpoint = '/api/reports/usersales'`

---

### [Reports Feature - Data Layer]

#### [NEW] [user_sales_report_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/models/user_sales_report_model.dart)
- Define `UserSalesReportRequest`, `UserSalesReportResponse`, `UserSalesReportData`, `UserSalesReportSummary`, and `UserSalesData` using `freezed`.

#### [reports_remote_data_source.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/data_sources/reports_remote_data_source.dart)
- Add `getUserSalesReport` method to fetch data from the new endpoint.

#### [reports_repository_impl.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/data/repositories/reports_repository_impl.dart)
- Implement `getUserSalesReport` in the repository.

---

### [Reports Feature - Domain Layer]

#### [reports_repository.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/domain/repositories/reports_repository.dart)
- Add `getUserSalesReport` abstract method.

---

### [Reports Feature - Presentation Layer]

#### [reports_controller.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/providers/reports_controller.dart)
- Add `UserSalesReportController` to manage the report state and fetching logic.

#### [NEW] [user_sales_report_content.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/widgets/user_sales_report_content.dart)
- Implement the UI for User Sales Report, including filters (Date Range, Fiscal Year), a searchable data table, and a summary footer.

#### [reports_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/landscape/reports_landscape_page.dart)
- Add "User Sales Report" to the sidebar.
- Update `_buildMainContent` to include `UserSalesReportContent`.

#### [reports_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/reports/presentation/portrait/reports_portrait_page.dart)
- Add "User" tab to the `BottomNavigationBar`.
- Update `_buildMainContent` to include `UserSalesReportContent(isPortrait: true)`.

---

## Verification Plan

### Automated Tests
- Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate freezed/json_serializable code.

### Manual Verification
- Navigate to the Reports page in both Portrait and Landscape orientations.
- Select the "User Sales Report" tab.
- Apply date and fiscal year filters and click "Search".
- Verify that the data table displays the user sales data correctly.
- Test the search functionality within the report.
- Verify the summary footer displays the correct totals.
