import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/reservation/presentation/widgets/reservation_dialog.dart';

import '../../../data/repositories/table_repository_impl.dart';

class TableCardPotrait extends ConsumerWidget {
  final TableModel table;

  const TableCardPotrait({super.key, required this.table});

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Iconify(
                      MaterialSymbols.table_bar,
                      color: statusColor,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      table.tableNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    table.status.toUpperCase(),
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: statusColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.people_outline, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '${table.capacity} Seats',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
                if (order != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.receipt_long, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '#${order.orderId}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontFamily: 'Manrope',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const Spacer(),
                if (isTransferMode)
                  if (table.status.toLowerCase() == 'available')
                    ActionButtonPotrait(
                      label: 'Transfer',
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
                        'Moving...',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    )
                  else
                    const SizedBox.shrink()
                else
                  ...[
                    if (table.status.toLowerCase() == 'occupied') ...[
                      ActionButtonPotrait(
                        label: 'View Order',
                        color: AppColors.primary,
                        onPressed: () {
                          // TODO: Implement View Order
                        },
                      ),
                      const SizedBox(height: 4),
                      ActionButtonPotrait(
                        label: 'Transfer',
                        color: AppColors.info,
                        isOutline: true,
                        onPressed: () => ref.read(transferTableStateProvider.notifier).startTransfer(table),
                      ),
                    ] else if (table.status.toLowerCase() == 'available') ...[
                      ActionButtonPotrait(
                        label: 'Place Order',
                        color: AppColors.success,
                        onPressed: () {
                          // TODO: Implement Place Order
                        },
                      ),
                      const SizedBox(height: 4),
                      ActionButtonPotrait(
                        label: 'Reservation',
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
                      ActionButtonPotrait(
                        label: 'Seat Guest',
                        color: AppColors.info,
                        onPressed: () {
                          // TODO: Implement Seat Guest
                        },
                      ),
                      const SizedBox(height: 4),
                      ActionButtonPotrait(
                        label: 'Cancel',
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
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.swap_horiz, color: Colors.blue, size: 16),
            ),
          ),
      ],
    );
  }
}

class ActionButtonPotrait extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isOutline;

  const ActionButtonPotrait({
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
      height: 30,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withValues(alpha: 0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          backgroundColor: isOutline ? Colors.transparent : (color == Colors.blue ? Colors.blue : Colors.white),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: (color == Colors.blue && !isOutline) ? Colors.white : color,
            fontWeight: FontWeight.bold,
            fontSize: 10,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }
}
