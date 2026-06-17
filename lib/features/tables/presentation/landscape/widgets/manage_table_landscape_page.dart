import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/table_list_section.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/table_edit_section.dart';

class ManageTableLandscapePage extends ConsumerWidget {
  const ManageTableLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Section - Table List
        VerticalDivider(width: 1),
        Expanded(
          flex: 1,
          child: TableListSection(),
        ),
        // Right Section - Edit Form
        Expanded(
          flex: 2,
          child: TableEditSection(),
        ),
      ],
    );
  }
}
