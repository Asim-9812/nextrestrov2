# Walkthrough - Place Order Screen (Landscape)

I have implemented a comprehensive "Place Order" feature for the landscape view of the application. This feature allows staff to select a table, add menu items with specific instructions, select or create a customer, and place the order with automatic confirmation.

## Key Accomplishments

### 1. Data Layer Enhancements
- Created `PlaceOrderRequest` and `PlaceOrderResponse` models to interact with the backend API.
- Updated `OrderRemoteDataSource` and `OrderRepository` to support `createOrder` (POST) and `updateOrderStatus` (PUT) operations.
- Automatically handles the requirement to hit `updateOrderStatus` with "Confirmed" after a successful order creation.

### 2. Robust State Management
- Implemented `PlaceOrderNotifier` using Riverpod to manage the entire order session.
- Features include:
  - Table selection and tracking.
  - Cart management (add/remove items, quantity adjustments).
  - Special instructions per item.
  - Customer selection and new customer creation.
  - Handling of the order placement lifecycle (loading, success, error).

### 3. Integrated UI Components
The screen is divided into three functional sections as requested:

#### Table Selection (Red Section)
- **Search & Filter:** Search tables by number and filter by floor.
- **Visual Cues:** Tables are color-coded by status (Available, Occupied, Reserved).
- **Order Info:** Displays active order IDs on occupied tables.

#### Menu Selection (Green Section)
- **Categorization:** Tabs for categories and subcategories for easy navigation.
- **Quick Actions:** Menu items feature immediate quantity increase/decrease controls.
- **Search:** Search menu items by name.

#### Order Preview (Yellow Section)
- **Summary:** Quick view of the selected table's details (number, capacity, floor).
- **Order Table:** List of items with quantity, subtotal, and an editable "Special Instruction" field.
- **Customer Management:** Select existing customers from a searchable dropdown or create a new one via a dialog.
- **Actions:** "Clear" button to reset the session and "Order" button to submit, both with confirmation dialogs.

## Verification Summary

### Static Analysis
- All new and modified files passed analysis with no errors or warnings.
- Code generation via `build_runner` was successful for all models and providers.

### Manual Verification Steps (Recommended for User)
1. **Navigate to the Place Order screen** in landscape mode.
2. **Select a table:** Verify it highlights and its info appears in the bottom section.
3. **Add items:** Use the +/- buttons in the menu section. Verify the order table updates.
4. **Special Instructions:** Type into the instruction field for an item and verify it persists.
5. **Customer:** Try searching for a customer and adding a new one via the dialog.
6. **Place Order:** Click "Order", confirm the dialog, and observe the success toaster and state reset.
7. **Clear Order:** Click "Clear", confirm, and verify the table selection and cart are wiped.
