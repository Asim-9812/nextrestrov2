import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';

class WaiterTableSelectionLandscapePage extends ConsumerWidget {
  const WaiterTableSelectionLandscapePage({super.key});

  Widget _statusFilter(WidgetRef ref, String label, int count, bool isSelected, {Color? color}) {
    return InkWell(
      onTap: () => ref.read(tableStatusFilterProvider.notifier).set(label),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? (color?.withValues(alpha: 0.1) ?? AppColors.bg) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? (color ?? AppColors.ashGrey) : AppColors.ashGrey.withValues(alpha: 0.3)),
        ),
        child: Text(
          '$label ($count)',
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: color ?? (isSelected ? Colors.black : AppColors.grey),
          ),
        ),
      ),
    );
  }

  Widget _floorChip(WidgetRef ref, String label, int? floorId, bool isSelected) {
    return InkWell(
      onTap: () => ref.read(manageTableFloorFilterProvider.notifier).set(floorId),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.ashGrey.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.primary : AppColors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesAsync = ref.watch(tablesStreamProvider);
    final selectedTable = ref.watch(placeOrderProvider.select((s) => s.selectedTable));
    final searchQuery = ref.watch(tableSearchQueryProvider);
    final currentStatusFilter = ref.watch(tableStatusFilterProvider);
    final statusCounts = ref.watch(tableStatusCountsProvider);
    final selectedFloorId = ref.watch(manageTableFloorFilterProvider);
    final floors = ref.watch(floorsProvider);
    final isGridView = ref.watch(tableViewModeProvider);

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.table_restaurant_outlined, color: Colors.orange, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Tables',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => ref.read(tableViewModeProvider.notifier).setList(),
                  icon: Icon(Icons.list_alt_rounded, size: 20, color: !isGridView ? Colors.orange : AppColors.grey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => ref.read(tableViewModeProvider.notifier).setGrid(),
                  icon: Icon(Icons.grid_view_rounded, size: 20, color: isGridView ? Colors.orange : AppColors.grey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (val) => ref.read(tableSearchQueryProvider.notifier).set(val),
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Search tables...',
                hintStyle: const TextStyle(fontSize: 12, color: AppColors.grey),
                prefixIcon: const Icon(Icons.search, size: 18, color: AppColors.grey),
                filled: true,
                fillColor: AppColors.bg,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Floor Filter Row
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _floorChip(ref, 'All Floors', null, selectedFloorId == null),
                ...floors.map((f) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _floorChip(ref, f['floorName'], f['floorID'], selectedFloorId == f['floorID']),
                )),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Status Filters
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _statusFilter(ref, 'All', statusCounts['All'] ?? 0, currentStatusFilter == 'All'),
                const SizedBox(width: 8),
                _statusFilter(ref, 'Available', statusCounts['Available'] ?? 0, currentStatusFilter == 'Available', color: Colors.green),
                const SizedBox(width: 8),
                _statusFilter(ref, 'Occupied', statusCounts['Occupied'] ?? 0, currentStatusFilter == 'Occupied', color: Colors.orange),
                const SizedBox(width: 8),
                _statusFilter(ref, 'Reserved', statusCounts['Reserved'] ?? 0, currentStatusFilter == 'Reserved', color: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Tables Display
          Expanded(
            child: tablesAsync.when(
              data: (tables) {
                final filtered = tables.where((t) {
                  final matchesSearch = t.tableNumber.toLowerCase().contains(searchQuery.toLowerCase());
                  final matchesStatus = currentStatusFilter == 'All' || t.status.toLowerCase() == currentStatusFilter.toLowerCase();
                  final matchesFloor = selectedFloorId == null || t.floorID == selectedFloorId;
                  return matchesSearch && matchesStatus && matchesFloor;
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No tables found', style: TextStyle(fontSize: 12)));
                }

                return isGridView 
                    ? _buildGridView(filtered, selectedTable, ref)
                    : _buildListView(filtered, selectedTable, ref);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 12))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add / Combine Table', style: TextStyle(fontSize: 12)),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                backgroundColor: AppColors.bg,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<TableModel> filtered, TableModel? selectedTable, WidgetRef ref) {
    final tableOrders = ref.watch(tableOrderMapProvider);
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final table = filtered[index];
        final isSelected = selectedTable?.tableID == table.tableID;
        final activeOrder = tableOrders[table.tableID];
        
        Color statusColor;
        bool isOccupied = false;
        
        switch (table.status.toLowerCase()) {
          case 'available': statusColor = Colors.green; break;
          case 'occupied': 
            statusColor = Colors.orange; 
            isOccupied = true;
            break;
          case 'reserved': statusColor = Colors.blue; break; // Added reserved blue
          default: statusColor = AppColors.grey;
        }

        return InkWell(
          onTap: () => ref.read(placeOrderProvider.notifier).selectTable(table),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? statusColor.withValues(alpha: 0.05) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? statusColor : AppColors.ashGrey.withValues(alpha: 0.5),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            table.tableNumber,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            table.floorName,
                            style: const TextStyle(fontSize: 9, color: AppColors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (isOccupied)
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle)),
                  ],
                ),
                const Spacer(),
                if (isOccupied && activeOrder != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'Order #${activeOrder.orderId}',
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ),
                Row(
                  children: [
                    const Icon(Icons.groups_outlined, size: 12, color: AppColors.grey),
                    const SizedBox(width: 4),
                    Text('${table.capacity} Seats', style: const TextStyle(fontSize: 10, color: AppColors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                isOccupied 
                  ? Row(
                      children: [
                        const Icon(Icons.schedule_outlined, size: 12, color: AppColors.grey),
                        const SizedBox(width: 4),
                        Text(
                          activeOrder != null 
                              ? TimeFormatter.formatDuration(activeOrder.date.toIso8601String())
                              : '00:00',
                          style: const TextStyle(fontSize: 10, color: AppColors.grey),
                        ),
                      ],
                    )
                  : Text(
                      table.status == 'Reserved' ? 'Reserved' : 'Available',
                      style: TextStyle(fontSize: 10, color: statusColor, fontWeight: FontWeight.bold),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView(List<TableModel> filtered, TableModel? selectedTable, WidgetRef ref) {
    final tableOrders = ref.watch(tableOrderMapProvider);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final table = filtered[index];
        final isSelected = selectedTable?.tableID == table.tableID;
        
        Color statusColor;
        switch (table.status.toLowerCase()) {
          case 'available': statusColor = Colors.green; break;
          case 'occupied': statusColor = Colors.orange; break;
          case 'reserved': statusColor = Colors.blue; break;
          default: statusColor = AppColors.grey;
        }

        return InkWell(
          onTap: () => ref.read(placeOrderProvider.notifier).selectTable(table),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? statusColor.withValues(alpha: 0.05) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? statusColor : AppColors.ashGrey.withValues(alpha: 0.3),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(table.tableNumber, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(table.floorName, style: const TextStyle(fontSize: 9, color: AppColors.grey)),
                  ],
                ),
                const SizedBox(width: 16),
                const Icon(Icons.groups_outlined, size: 14, color: AppColors.grey),
                const SizedBox(width: 4),
                Text('${table.capacity} Seats', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                const Spacer(),
                if (table.status.toLowerCase() == 'occupied' && tableOrders[table.tableID] != null)
                   Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      '#${tableOrders[table.tableID]!.orderId}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    table.status,
                    style: TextStyle(fontSize: 10, color: statusColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
