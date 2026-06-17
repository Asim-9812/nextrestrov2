import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/tables/presentation/potrait/widgets/table_edit_potrait_page.dart';

class ManageTablePotraitPage extends ConsumerWidget {
  const ManageTablePotraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tables = ref.watch(filteredManageTablesProvider);
    final floors = ref.watch(floorsProvider);
    final selectedFloorId = ref.watch(manageTableFloorFilterProvider);

    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restaurant Tables',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: TextField(
              onChanged: (val) => ref.read(manageTableSearchQueryProvider.notifier).set(val),
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Search Table...',
                hintStyle: const TextStyle(fontSize: 13),
                prefixIcon: const Icon(Icons.search, color: AppColors.primary, size: 18),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: DropdownButtonFormField<int?>(
              value: selectedFloorId,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              items: [
                const DropdownMenuItem(value: null, child: Text('All Floors')),
                ...floors.map((f) => DropdownMenuItem(
                      value: f['floorID'] as int,
                      child: Text(f['floorName'] as String),
                    )),
              ],
              onChanged: (val) => ref.read(manageTableFloorFilterProvider.notifier).set(val),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: tables.length,
              itemBuilder: (context, index) {
                final table = tables[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.table_bar_outlined,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ),
                      title: Text(
                        'Table ${table.tableNumber}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 13,
                        ),
                      ),
                      subtitle: Text(
                        '${table.floorName} • ${table.capacity} Seats',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right, color: AppColors.ashGrey, size: 20),
                      onTap: () {
                        ref.read(selectedTableForEditProvider.notifier).select(table);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TableEditPotraitPage(),
                          ),
                        );
                      },
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
