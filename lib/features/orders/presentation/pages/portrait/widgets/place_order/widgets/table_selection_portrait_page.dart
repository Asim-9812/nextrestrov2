import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';

class TableSelectionPortraitPage extends ConsumerWidget {
  const TableSelectionPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesAsync = ref.watch(tablesStreamProvider);
    final selectedTable = ref.watch(placeOrderProvider.select((s) => s.selectedTable));
    final searchQuery = ref.watch(tableSearchQueryProvider);
    final floors = ref.watch(floorsProvider);
    final selectedFloorId = ref.watch(manageTableFloorFilterProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (val) => ref.read(tableSearchQueryProvider.notifier).set(val),
                decoration: InputDecoration(
                  hintText: 'Search Table...',
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFloorChip(ref, null, 'All Floors', selectedFloorId == null),
                    ...floors.map((f) => _buildFloorChip(ref, f['floorID'], f['floorName'], selectedFloorId == f['floorID'])),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: tablesAsync.when(
            data: (tables) {
              final filtered = tables.where((t) {
                final matchesSearch = t.tableNumber.toLowerCase().contains(searchQuery.toLowerCase());
                final matchesFloor = selectedFloorId == null || t.floorID == selectedFloorId;
                return matchesSearch && matchesFloor;
              }).toList();

              if (filtered.isEmpty) return const Center(child: Text('No tables found'));

              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final table = filtered[index];
                  final isSelected = selectedTable?.tableID == table.tableID;
                  
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
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isSelected ? statusColor : AppColors.ashGrey, width: isSelected ? 2 : 1),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(table.tableNumber, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(
                            table.status.toUpperCase(),
                            style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }

  Widget _buildFloorChip(WidgetRef ref, int? floorId, String name, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(name),
        selected: isSelected,
        onSelected: (val) => ref.read(manageTableFloorFilterProvider.notifier).set(floorId),
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
      ),
    );
  }
}
