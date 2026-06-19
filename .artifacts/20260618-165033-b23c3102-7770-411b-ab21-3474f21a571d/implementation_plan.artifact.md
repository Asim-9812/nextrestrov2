# Implementation Plan - Department Module

Implement the Department management module following the project's existing architecture and patterns.

## Proposed Changes

### Department Feature

#### [department_model.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/data/models/department_model.dart)
- Define `DepartmentModel` with `departmentID`, `departmentName`, and `status`.
- Use `freezed` and `json_serializable`.

#### [department_repository.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/domain/repositories/department_repository.dart)
- Define the interface for department operations.

#### [department_repository_impl.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/data/repositories/department_repository_impl.dart)
- Implement API calls using `ApiClient`.
- Integrate `Logger` for tracking.

#### [department_provider.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/presentation/providers/department_provider.dart)
- Create Riverpod providers for state management.
- Handle data invalidation for reactive updates.

#### [department_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/presentation/pages/department_page.dart)
- Responsive wrapper for Department UI.

#### [department_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/presentation/pages/portrait/department_portrait_page.dart)
- Portrait layout with tabbed list and form.

#### [department_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/department/presentation/pages/landscape/department_landscape_page.dart)
- Landscape layout with side-by-side list and form.

---

### Dashboard Integration

#### [admin_dashboard_potrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/potrait/admin_dashboard_potrait_page.dart)
- Replace placeholder with `DepartmentPage` at index 9.

#### [admin_dashboard_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/admin_dashboard/presentation/landscape/admin_dashboard_landscape_page.dart)
- Replace placeholder with `DepartmentPage` at index 9.

## Verification Plan

### Automated Tests
- Run `dart run build_runner build` to ensure code generation is correct.
- Run `flutter analyze` to check for static issues.

### Manual Verification
- Verify navigation to Department Management from Admin Dashboard.
- Test listing, searching, creating, updating, and deleting departments.
- Verify that the list updates immediately after changes.
