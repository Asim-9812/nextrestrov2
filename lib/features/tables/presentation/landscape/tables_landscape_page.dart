import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/reservation/presentation/widgets/reservation_management_landscape_page.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/add_table_form.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/manage_table_landscape_page.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/all_tables_content.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/tables_sidebar_item.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/transfer_banner.dart';

class TablesLandscapePage extends ConsumerWidget {
  const TablesLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTableMenuProvider);
    final transferSource = ref.watch(transferTableStateProvider);
    final userRole = ref.watch(sessionServiceProvider).getUser()?['role']?.toString().toLowerCase();
    final isWaiter = userRole == 'waiter';

    return Column(
      children: [
        if (transferSource != null) TransferBanner(sourceTable: transferSource),
        Expanded(
          child: Row(
            children: [
              // Left Section - Sidebar Menu
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: AppColors.white),
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      TablesSidebarItem(
                        icon: MaterialSymbols.table_bar,
                        label: 'All Tables',
                        isSelected: selectedIndex == 0,
                        onTap: () => ref.read(selectedTableMenuProvider.notifier).set(0),
                      ),
                      if (!isWaiter) ...[
                        TablesSidebarItem(
                          icon: MaterialSymbols.playlist_add_circle_rounded,
                          label: 'Add Tables',
                          isSelected: selectedIndex == 1,
                          onTap: () => ref.read(selectedTableMenuProvider.notifier).set(1),
                        ),
                        TablesSidebarItem(
                          icon: MaterialSymbols.manage_search_rounded,
                          label: 'Manage Tables',
                          isSelected: selectedIndex == 2,
                          onTap: () => ref.read(selectedTableMenuProvider.notifier).set(2),
                        ),
                      ],
                      TablesSidebarItem(
                        icon: MaterialSymbols.event_available,
                        label: 'Reservation',
                        isSelected: selectedIndex == 3,
                        onTap: () => ref.read(selectedTableMenuProvider.notifier).set(3),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Section - Content
              Expanded(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  color: AppColors.bg,
                  child: _buildMainContent(ref, selectedIndex),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(WidgetRef ref, int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const AllTablesContent();
      case 1:
        return const AddTableForm();
      case 2:
        return const ManageTableLandscapePage();
      case 3:
        return const ReservationManagementLandscapePage();
      default:
        return const SizedBox.shrink();
    }
  }
}
