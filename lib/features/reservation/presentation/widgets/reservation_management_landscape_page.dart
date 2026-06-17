import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/reservation/presentation/widgets/reservation_list_section.dart';
import 'package:nextrestro/features/reservation/presentation/widgets/reservation_detail_section.dart';

class ReservationManagementLandscapePage extends ConsumerWidget {
  const ReservationManagementLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalDivider(width: 1),
        // Left Section - Reservation List
        Expanded(
          flex: 1,
          child: ReservationListSection(),
        ),

        // Right Section - Reservation Details
        Expanded(
          flex: 2,
          child: ReservationDetailSection(),
        ),
      ],
    );
  }
}
