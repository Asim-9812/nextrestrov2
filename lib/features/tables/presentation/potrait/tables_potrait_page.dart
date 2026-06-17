import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/tables/presentation/potrait/widgets/all_tables_potrait_content.dart';
import 'package:nextrestro/features/tables/presentation/potrait/widgets/add_table_potrait_form.dart';
import 'package:nextrestro/features/tables/presentation/potrait/widgets/manage_table_potrait_page.dart';
import 'package:nextrestro/features/reservation/presentation/potrait/reservation_management_potrait_page.dart';

class TablesPotraitPage extends ConsumerWidget {
  const TablesPotraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedTableMenuProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            AllTablesPotraitContent(),
            AddTablePotraitForm(),
            ManageTablePotraitPage(),
            ReservationManagementPotraitPage(),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => ref.read(selectedTableMenuProvider.notifier).set(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.table_bar_outlined),
              activeIcon: Icon(Icons.table_bar),
              label: 'Tables',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              activeIcon: Icon(Icons.manage_search),
              label: 'Manage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_available_outlined),
              activeIcon: Icon(Icons.event_available),
              label: 'Reservation',
            ),
          ],
        ),
      ),
    );
  }
}
