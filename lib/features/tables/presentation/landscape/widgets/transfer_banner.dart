import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';

class TransferBanner extends ConsumerWidget {
  final TableModel sourceTable;

  const TransferBanner({super.key, required this.sourceTable});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.blue.withValues(alpha: 0.1),
      child: Row(
        children: [
          const Icon(Icons.swap_horiz, color: Colors.blue),
          const SizedBox(width: 12),
          Text(
            'Select a target table to transfer Order from Table ${sourceTable.tableNumber}',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => ref.read(transferTableStateProvider.notifier).cancelTransfer(),
            child: const Text(
              'CANCEL TRANSFER',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
