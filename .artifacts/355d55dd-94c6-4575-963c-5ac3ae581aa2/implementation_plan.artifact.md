# Realign Product Management Form Fields

This plan outlines the realignment of form fields in both landscape and portrait product management pages to improve layout and grouping.

## Proposed Changes

### Presentation Layer

#### [MODIFY] [manage_products_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/landscape/sections/manage_products_landscape_page.dart)
- **`ProductEditSection` & `AddProductSection`**:
    - Wrap `Product Name` and `Price` in a `Row` with a `2:1` (or `3:1`) ratio using `Expanded(flex: ...)` widgets.
    - Keep `Category` and `Sub Category` in a `Row` (already done in previous step, but will ensure clean alignment).
    - `Description`, `Image URL`, `Is Taxable`, and `Status` will follow in their own rows/sections.

#### [MODIFY] [manage_products_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/portrait/sections/manage_products_portrait_page.dart)
- **`_buildEditView` & `_buildAddForm`**:
    - Wrap `Product Name` and `Price` in a `Row` with a `2:1` ratio.
    - Ensure `Category` and `Sub Category` are in a `Row` with `1:1` ratio.
    - Adjust padding and spacing for better fit on narrow screens.

## Verification Plan

### Manual Verification
- **Landscape View**:
    - Check "Add New Product" form: verify Name and Price are side-by-side.
    - Check "Edit Product" form: verify consistent alignment.
- **Portrait View**:
    - Verify fields fit without overflow when side-by-side.
    - Ensure dropdowns are fully visible and interactive.
