import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';

class TableListSection extends ConsumerWidget {
  const TableListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tables = ref.watch(filteredManageTablesProvider);
    final floors = ref.watch(floorsProvider);
    final selectedFloorId = ref.watch(manageTableFloorFilterProvider);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restaurant Tables',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (val) => ref.read(manageTableSearchQueryProvider.notifier).set(val),
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Search Table...',
              hintStyle: const TextStyle(fontSize: 12),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              filled: true,
              fillColor: AppColors.bg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int?>(
            value: selectedFloorId,
            items: [
              const DropdownMenuItem(value: null, child: Text('All Floors')),
              ...floors.map((f) => DropdownMenuItem(
                    value: f['floorID'] as int,
                    child: Text(f['floorName'] as String),
                  )),
            ],
            onChanged: (val) => ref.read(manageTableFloorFilterProvider.notifier).set(val),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              filled: true,
              fillColor: AppColors.bg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tables.length,
              itemBuilder: (context, index) {
                final table = tables[index];
                final isSelected = ref.watch(selectedTableForEditProvider)?.tableID == table.tableID;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Material(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.white,
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.bg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.table_bar_outlined,
                          color: isSelected ? Colors.white : AppColors.primary,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        'Table ${table.tableNumber}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 14,
                          color: isSelected ? AppColors.primary : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        '${table.floorName} • ${table.capacity} Seats',
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? AppColors.primary.withValues(alpha: 0.7) : Colors.grey,
                        ),
                      ),
                      onTap: () => ref.read(selectedTableForEditProvider.notifier).select(table),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
