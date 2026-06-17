import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/reservation/presentation/widgets/reservation_dialog.dart';

import '../../../data/repositories/table_repository_impl.dart';

class AllTablesContent extends ConsumerWidget {
  const AllTablesContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedTables = ref.watch(filteredGroupedTablesProvider);
    final tablesAsync = ref.watch(tablesStreamProvider);

    return Column(
      children: [
        // Top Filter and Search Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tables',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Manage and monitor all restaurant tables',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(tableSearchQueryProvider.notifier).set(val),
                  decoration: InputDecoration(
                    hintText: 'Search Table...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        const StatusFilterChips(),
        // Tables List grouped by floor
        Expanded(
          child: tablesAsync.when(
            data: (_) {
              if (groupedTables.isEmpty) {
                return const Center(child: Text('No tables found'));
              }
              return ListView.builder(
                itemCount: groupedTables.length,
                itemBuilder: (context, index) {
                  final floorName = groupedTables.keys.elementAt(index);
                  final tables = groupedTables[floorName]!;
                  return ExpansionTile(
                    title: Text(
                      floorName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.95,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: tables.length,
                          itemBuilder: (context, idx) {
                            return TableCard(table: tables[idx]);
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }
}

class StatusFilterChips extends ConsumerWidget {
  const StatusFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(tableStatusFilterProvider);
    final counts = ref.watch(tableStatusCountsProvider);
    final filters = ['All', 'Available', 'Occupied', 'Reserved'];

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
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
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () => ref.read(tableStatusFilterProvider.notifier).set(filter),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? (filter == 'All' ? AppColors.ashGrey.withValues(alpha: 0.3) : dotColor.withValues(alpha: 0.1)) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (filter != 'All') ...[
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: dotColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      '$filter ($count)',
                      style: TextStyle(
                        color: isSelected ? (filter == 'All' ? AppColors.blackGrey : dotColor) : AppColors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
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

class TableCard extends ConsumerWidget {
  final TableModel table;

  const TableCard({super.key, required this.table});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transferSource = ref.watch(transferTableStateProvider);
    final tableOrders = ref.watch(tableOrderMapProvider);
    final order = tableOrders[table.tableID];
    
    final isSource = transferSource?.tableID == table.tableID;
    final isTransferMode = transferSource != null;

    Color statusColor;
    Color bgColor;
    switch (table.status.toLowerCase()) {
      case 'available':
        statusColor = AppColors.success;
        bgColor = AppColors.white;
        break;
      case 'occupied':
        statusColor = AppColors.primary;
        bgColor = const Color(0xFFFFF9F4);
        break;
      case 'reserved':
        statusColor = AppColors.info;
        bgColor = Colors.blue.withValues(alpha: 0.05);
        break;
      default:
        statusColor = AppColors.grey;
        bgColor = AppColors.white;
    }

    return Stack(
      children: [
        Card(
          color: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSource ? Colors.blue : statusColor.withValues(alpha: 0.3),
              width: isSource ? 2.0 : 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Iconify(
                      MaterialSymbols.table_bar,
                      color: statusColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      table.tableNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    table.status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: statusColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.people_outline, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      '${table.capacity} Seats',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
                if (order != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.receipt_long, size: 14, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        'Order #${order.orderId}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                ],
                const Spacer(),
                if (isTransferMode)
                  if (table.status.toLowerCase() == 'available')
                    ActionButton(
                      label: 'Transfer Here',
                      color: Colors.blue,
                      onPressed: () async {
                        final sourceTable = transferSource;
                        final sourceOrderId = tableOrders[sourceTable.tableID]?.orderId;
                        if (sourceOrderId != null) {
                           try {
                             await ref.read(tableRepositoryProvider).transferTable(sourceOrderId, table.tableID);
                             if (context.mounted) {
                               ref.read(transferTableStateProvider.notifier).cancelTransfer();
                               ref.invalidate(tablesStreamProvider);
                             }
                           } catch (e) {
                             if (context.mounted) {
                               ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text('Transfer failed: $e')),
                               );
                             }
                           }
                        }
                      },
                    )
                  else if (isSource)
                    const Center(
                      child: Text(
                        'Transferring...',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  else
                    const SizedBox.shrink()
                else
                  ...[
                    if (table.status.toLowerCase() == 'occupied') ...[
                      ActionButton(
                        label: 'View Order',
                        color: AppColors.primary,
                        onPressed: () {
                          // TODO: Implement View Order
                        },
                      ),
                      const SizedBox(height: 8),
                      ActionButton(
                        label: 'Transfer Table',
                        color: AppColors.info,
                        isOutline: true,
                        onPressed: () => ref.read(transferTableStateProvider.notifier).startTransfer(table),
                      ),
                    ] else if (table.status.toLowerCase() == 'available') ...[
                      ActionButton(
                        label: 'Place Order',
                        color: AppColors.success,
                        onPressed: () {
                          // TODO: Implement Place Order
                        },
                      ),
                      const SizedBox(height: 8),
                      ActionButton(
                        label: 'Set Reservation',
                        color: AppColors.info,
                        isOutline: true,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => ReservationDialog(table: table),
                          );
                        },
                      ),
                    ] else if (table.status.toLowerCase() == 'reserved') ...[
                      ActionButton(
                        label: 'Seat Guest',
                        color: AppColors.info,
                        onPressed: () {
                          // TODO: Implement Seat Guest
                        },
                      ),
                      const SizedBox(height: 8),
                      ActionButton(
                        label: 'Cancel Reservation',
                        color: AppColors.error,
                        isOutline: true,
                        onPressed: () {
                          // TODO: Implement Cancel Reservation
                        },
                      ),
                    ],
                  ]
              ],
            ),
          ),
        ),
        if (isSource)
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.swap_horiz, color: Colors.blue, size: 20),
            ),
          ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isOutline;

  const ActionButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withValues(alpha: 0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: isOutline ? Colors.transparent : (color == Colors.blue ? Colors.blue : Colors.white),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: (color == Colors.blue && !isOutline) ? Colors.white : color,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }
}
