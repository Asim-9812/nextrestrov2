import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/all_tables_content.dart';
import 'package:nextrestro/features/tables/presentation/potrait/widgets/table_card_potrait.dart';

class AllTablesPotraitContent extends ConsumerWidget {
  const AllTablesPotraitContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedTables = ref.watch(filteredGroupedTablesProvider);
    final tablesAsync = ref.watch(tablesStreamProvider);

    return Column(
      children: [
        // Top Filter and Search Bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tables',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Manage and monitor all restaurant tables',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (val) => ref.read(tableSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Search Table...',
                    hintStyle: const TextStyle(fontSize: 13),
                    prefixIcon: const Icon(Icons.search, size: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                const StatusFilterChipsPotrait(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Tables List grouped by floor
        Expanded(
          child: tablesAsync.when(
            data: (_) {
              if (groupedTables.isEmpty) {
                return const Center(child: Text('No tables found', style: TextStyle(fontSize: 13)));
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: groupedTables.length,
                itemBuilder: (context, index) {
                  final floorName = groupedTables.keys.elementAt(index);
                  final tables = groupedTables[floorName]!;
                  return ExpansionTile(
                    title: Text(
                      floorName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: tables.length,
                          itemBuilder: (context, idx) {
                            return TableCardPotrait(table: tables[idx]);
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 13))),
          ),
        ),
      ],
    );
  }
}

class StatusFilterChipsPotrait extends ConsumerWidget {
  const StatusFilterChipsPotrait({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(tableStatusFilterProvider);
    final counts = ref.watch(tableStatusCountsProvider);
    final filters = ['All', 'Available', 'Occupied', 'Reserved'];

    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: filters.map((filter) {
          final isSelected = currentFilter == filter;
          final count = counts[filter] ?? 0;

          Color dotColor;
          switch (filter.toLowerCase()) {
            case 'available':
              dotColor = AppColors.success;
              break;
            case 'occupied':
              dotColor = AppColors.primary;
              break;
            case 'reserved':
              dotColor = AppColors.info;
              break;
            default:
              dotColor = AppColors.grey;
          }

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () => ref.read(tableStatusFilterProvider.notifier).set(filter),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? (filter == 'All' ? AppColors.ashGrey.withValues(alpha: 0.3) : dotColor.withValues(alpha: 0.1)) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (filter != 'All') ...[
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: dotColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      '$filter ($count)',
                      style: TextStyle(
                        color: isSelected ? (filter == 'All' ? AppColors.blackGrey : dotColor) : AppColors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
