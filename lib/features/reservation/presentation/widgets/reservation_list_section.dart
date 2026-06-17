import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';

class ReservationListSection extends ConsumerWidget {
  const ReservationListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsAsync = ref.watch(allReservationsProvider);
    final searchQuery = ref.watch(reservationSearchQueryProvider).toLowerCase();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reservations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (val) => ref.read(reservationSearchQueryProvider.notifier).set(val),
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Search by Customer...',
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              filled: true,
              fillColor: AppColors.bg,
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Expanded(
            child: reservationsAsync.when(
              data: (reservations) {
                if (reservations.isEmpty) {
                  return const Center(child: Text('No reservations found'));
                }
                return ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final res = reservations[index];
                    return ReservationListItemTile(reservation: res, searchQuery: searchQuery);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationListItemTile extends ConsumerWidget {
  final ReservationListItem reservation;
  final String searchQuery;

  const ReservationListItemTile({
    super.key,
    required this.reservation,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerAsync = ref.watch(customerInfoProvider(reservation.customerID));
    final isSelected = ref.watch(selectedReservationIdProvider) == reservation.reservationID;

    return customerAsync.when(
      data: (customer) {
        final name = '${customer.firstName} ${customer.lastName}';
        if (searchQuery.isNotEmpty && !name.toLowerCase().contains(searchQuery)) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Material(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: isSelected ? AppColors.primary2 : Colors.white,
              leading: CircleAvatar(
                backgroundColor: isSelected ? AppColors.primary : AppColors.bg,
                child: Text(
                  customer.firstName[0],
                  style: TextStyle(color: isSelected ? AppColors.white : AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 14,
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
              ),
              subtitle: Text(
                DateFormat('MMM dd, yyyy • hh:mm a').format(reservation.reservationDate),
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? AppColors.primary : Colors.grey,
                ),
              ),
              onTap: () => ref.read(selectedReservationIdProvider.notifier).select(reservation.reservationID),
            ),
          ),
        );
      },
      loading: () => const SizedBox(height: 72, child: Center(child: LinearProgressIndicator())),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
