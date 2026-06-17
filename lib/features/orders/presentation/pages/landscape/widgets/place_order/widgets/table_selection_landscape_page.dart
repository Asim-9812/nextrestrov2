import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';

class TableSelectionLandscapePage extends ConsumerWidget {
  const TableSelectionLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesAsync = ref.watch(tablesStreamProvider);
    final selectedTable = ref.watch(placeOrderProvider.select((s) => s.selectedTable));
    final searchQuery = ref.watch(tableSearchQueryProvider);
    final floors = ref.watch(floorsProvider);
    final selectedFloorId = ref.watch(manageTableFloorFilterProvider);

    return Container(
      color: AppColors.bg,
      child: Column(
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Iconify(MaterialSymbols.table_bar, color: Colors.black, size: 16),
                SizedBox(width: 8),
                Text(
                  'Select Table',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                ),
              ],
            ),
          ),
          
          // Search and Floor Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => ref.read(tableSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Search Table...',
                    hintStyle: const TextStyle(fontSize: 12),
                    prefixIcon: const Icon(Icons.search, size: 16),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<int?>(
                  value: selectedFloorId,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  hint: const Text('All Floors', style: TextStyle(fontSize: 12)),
                  items: [
                    const DropdownMenuItem<int?>(value: null, child: Text('All Floors', style: TextStyle(fontSize: 12))),
                    ...floors.map((f) => DropdownMenuItem<int?>(
                          value: f['floorID'],
                          child: Text(f['floorName'], style: const TextStyle(fontSize: 12)),
                        )),
                  ],
                  onChanged: (val) => ref.read(manageTableFloorFilterProvider.notifier).set(val),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Tables Grid
          Expanded(
            child: tablesAsync.when(
              data: (tables) {
                final filtered = tables.where((t) {
                  final matchesSearch = t.tableNumber.toLowerCase().contains(searchQuery.toLowerCase());
                  final matchesFloor = selectedFloorId == null || t.floorID == selectedFloorId;
                  return matchesSearch && matchesFloor;
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No tables found', style: TextStyle(fontSize: 12)));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final table = filtered[index];
                    final isSelected = selectedTable?.tableID == table.tableID;
                    final tableOrders = ref.watch(tableOrderMapProvider);
                    final order = tableOrders[table.tableID];

                    Color statusColor;
                    switch (table.status.toLowerCase()) {
                      case 'available': statusColor = AppColors.success; break;
                      case 'occupied': statusColor = AppColors.primary; break;
                      case 'reserved': statusColor = AppColors.info; break;
                      default: statusColor = AppColors.grey;
                    }

                    return InkWell(
                      onTap: () => ref.read(placeOrderProvider.notifier).selectTable(table),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? statusColor.withValues(alpha: 0.1) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? statusColor : AppColors.ashGrey,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              table.tableNumber,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              table.status,
                              style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            if (order != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                'Order #${order.orderId}',
                                style: const TextStyle(fontSize: 9, color: AppColors.grey),
                              ),
                            ]
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 12))),
            ),
          ),
        ],
      ),
    );
  }
}
