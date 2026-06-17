# Implementation Plan - Place Order Screen (Landscape)

Implement a comprehensive "Place Order" screen for landscape view, divided into three sections: Table Selection, Menu Selection, and Order Preview.

## Proposed Changes

### [Orders Feature - Data Layer]

#### [NEW] [place_order_request.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/data/models/place_order_request.dart)
- Define `PlaceOrderRequest` and `PlaceOrderItem` models for the API request.

#### [NEW] [place_order_response.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/data/models/place_order_response.dart)
- Define `PlaceOrderResponse` to handle the order creation response.

#### [order_remote_data_source.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/data/data_sources/order_remote_data_source.dart)
- Add `createOrder(PlaceOrderRequest request)` using `POST`.
- Add `updateOrderStatus(int orderId, String status)` using `PUT`.

#### [order_repository.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/domain/repositories/order_repository.dart)
- Add abstract methods for `createOrder` and `updateOrderStatus`.

#### [order_repository_impl.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/data/repositories/order_repository_impl.dart)
- Implement `createOrder` and `updateOrderStatus`.

---

### [Orders Feature - State Management]

#### [NEW] [place_order_provider.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/presentation/providers/place_order_provider.dart)
- Create `PlaceOrderState` class (selectedTable, items, selectedCustomer, isPlacingOrder).
- Create `PlaceOrderNotifier` to manage the order session.
- Methods: `selectTable`, `addItem`, `removeItem`, `updateQuantity`, `updateSpecialInstruction`, `setCustomer`, `clearOrder`, `placeOrder`.

---

### [Orders Feature - UI Components]

#### [NEW] [table_selection_section.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/presentation/pages/landscape/widgets/table_selection_section.dart)
- Implement the red section.
- Search bar, Floor dropdown.
- Grid of tables (reusing logic from `AllTablesContent`).
- Status indicator footer.

#### [NEW] [menu_selection_section.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/presentation/pages/landscape/widgets/menu_selection_section.dart)
- Implement the green section.
- Title and Search row.
- Category and Subcategory tabs.
- Menu item grid with +/- quantity buttons.

#### [NEW] [order_preview_section.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/presentation/pages/landscape/widgets/order_preview_section.dart)
- Implement the yellow section.
- Layout: Table Details | Order Table | Customer & Actions.
- Table showing SN, Item, Qty, Special Instruction (TextField).
- Customer selection dropdown and "New Customer" button (dialog).
- Confirmation dialogs for "Clear" and "Place Order".

#### [orders_place_order_landscape_view.dart](file:///D:/StudioProjects/nextrestro/lib/features/orders/presentation/pages/landscape/widgets/orders_place_order_landscape_view.dart)
- Replace placeholders with the new section widgets.

## Verification Plan

### Automated Tests
- N/A (Project seems to focus on manual verification for now)

### Manual Verification
1.  **UI Layout:** Check if the three sections are correctly displayed in landscape mode.
2.  **Table Selection:** Select a table and verify it appears in the preview section.
3.  **Menu Selection:** Add items, change quantities, and verify they appear in the preview table.
4.  **Special Instructions:** Type instructions for an item and verify they are stored.
5.  **Customer Selection:** Select an existing customer or create a new one.
6.  **Place Order:** Click "Place Order", confirm, and verify the API calls (logger/toaster).
7.  **Clear Order:** Click "Clear", confirm, and verify everything resets.
