import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:nextrestro/features/reservation/presentation/potrait/reservation_detail_potrait_page.dart';

class ReservationManagementPotraitPage extends ConsumerWidget {
  const ReservationManagementPotraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsAsync = ref.watch(allReservationsProvider);
    final searchQuery = ref.watch(reservationSearchQueryProvider).toLowerCase();

    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reservations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: TextField(
              onChanged: (val) => ref.read(reservationSearchQueryProvider.notifier).set(val),
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Search by Customer...',
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
          const SizedBox(height: 12),
          Expanded(
            child: reservationsAsync.when(
              data: (reservations) {
                if (reservations.isEmpty) {
                  return const Center(child: Text('No reservations found', style: TextStyle(fontSize: 13)));
                }
                return ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final res = reservations[index];
                    final customerAsync = ref.watch(customerInfoProvider(res.customerID));

                    return customerAsync.when(
                      data: (customer) {
                        final name = '${customer.firstName} ${customer.lastName}';
                        if (searchQuery.isNotEmpty && !name.toLowerCase().contains(searchQuery)) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.bg,
                                child: Text(
                                  customer.firstName[0],
                                  style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ),
                              title: Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                DateFormat('MMM dd, yyyy • hh:mm a').format(res.reservationDate),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: const Icon(Icons.chevron_right, color: AppColors.ashGrey, size: 20),
                              onTap: () {
                                ref.read(selectedReservationIdProvider.notifier).select(res.reservationID);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ReservationDetailPotraitPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      loading: () => const SizedBox(height: 60, child: Center(child: LinearProgressIndicator())),
                      error: (_, __) => const SizedBox.shrink(),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 13))),
            ),
          ),
        ],
      ),
    );
  }
}
