# Improve Portrait Admin Dashboard UI

The goal is to update the portrait version of the admin dashboard to match the visual style and content richness of the landscape version, while ensuring it remains optimized for vertical screens.

## Proposed Changes

### [Admin Dashboard Common Widgets]

Move shared widgets to a central location and update them for responsiveness.

#### [NEW] [quick_actions_row.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/widgets/quick_actions_row.dart)
- Move from `landscape/widgets/quick_actions_row.dart` to `widgets/quick_actions_row.dart`.

#### [DELETE] [quick_actions_row.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/landscape/widgets/quick_actions_row.dart)

#### [sales_summary_pie_chart.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/widgets/sales_summary_pie_chart.dart)
- Add `isPortrait` parameter.
- If `isPortrait` is true, stack the chart and legend vertically instead of horizontally.

#### [NEW] [portrait_active_shift_card.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/potrait/widgets/portrait_active_shift_card.dart)
- Create a more visually appealing shift card for portrait, matching the `ActiveShiftCard` "vibe" but with a vertical layout for info sections.

---

### [Admin Dashboard Portrait Page]

#### [admin_dashboard_potrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/potrait/admin_dashboard_potrait_page.dart)
- Update `Scaffold` background to `AppColors.white`.
- Refactor `_buildDateRangeSelector` to be compact.
- Update `_buildHomeTab`:
    - Increase padding and use consistent spacing.
    - Add `QuickActionsRow`.
    - Add "Overview" Row with title and compact date range selector.
    - Use `SummaryBentoBox` (horizontal scrollable).
    - Add `SalesSummaryPieChart` and `OrdersOverviewGrid` in a vertical stack.
    - Use the new `PortraitActiveShiftCard` when a shift is active.

---

### [Admin Dashboard Landscape Page]

#### [admin_dashboard_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/landscape/admin_dashboard_landscape_page.dart)
- Update import path for `QuickActionsRow`.

## Verification Plan

### Manual Verification
- Run the app on a mobile emulator (portrait).
- Verify the new background color and spacing.
- Check the Quick Actions row functionality.
- Verify that `SalesSummaryPieChart` and `OrdersOverviewGrid` are displayed correctly and stacked.
- Check the new active shift card design.
- Switch to landscape and ensure it still looks good and works as expected.
