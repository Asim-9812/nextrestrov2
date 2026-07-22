# Implementation Plan - Add Progress Indicators for Menu Management

Add loading indicators and disable action buttons while adding, updating, or deleting products, categories, and subcategories to improve user feedback.

## User Review Required

> [!NOTE]
> Progress indicators will be added primarily to the action buttons (Save, Create, Delete). Input fields will also be disabled during operations to prevent concurrent edits.

## Proposed Changes

### [Features] [Menu - Presentation]

#### [MODIFY] [manage_products_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/landscape/sections/manage_products_landscape_page.dart)
- Watch `createProductStateProvider`, `updateProductStateProvider`, and `deleteProductStateProvider`.
- Show `CircularProgressIndicator` on "Save Changes", "Create Product", and "Delete" buttons when loading.
- Disable buttons and input fields during operations.

#### [MODIFY] [manage_products_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/portrait/sections/manage_products_portrait_page.dart)
- Similar changes as landscape: watch state providers and update buttons/inputs with loading states.

#### [MODIFY] [manage_category_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/landscape/sections/manage_category_landscape_page.dart)
- Watch `createCategoryStateProvider`, `updateCategoryStateProvider`, and `deleteCategoryStateProvider`.
- Update action buttons to show loading state and disable interactions.

#### [MODIFY] [manage_category_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/portrait/sections/manage_category_portrait_page.dart)
- Implement loading states for category operations in portrait mode.

#### [MODIFY] [manage_sub_category_landscape_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/landscape/sections/manage_sub_category_landscape_page.dart)
- Ensure all action buttons (Update, Delete, Create) in `SubCategoryEditSection` and `AddSubCategorySection` have loading indicators.

#### [MODIFY] [manage_sub_category_portrait_page.dart](file:///D:/StudioProjects/nextrestro/lib/features/menu/presentation/portrait/sections/manage_sub_category_portrait_page.dart)
- Review and finalize existing loading indicators to ensure consistency with other pages.

## Verification Plan

### Manual Verification
- **Products**: Add a new product with an image and verify the "Create Product" button shows a loader and disables itself. Repeat for "Save Changes" and "Delete".
- **Categories**: Perform Add, Update, and Delete operations and verify loading feedback.
- **Sub-Categories**: Perform Add, Update, and Delete operations and verify loading feedback.
- Verify both **Landscape** and **Portrait** orientations.
