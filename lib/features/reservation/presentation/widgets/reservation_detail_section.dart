import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';

class ReservationDetailSection extends ConsumerWidget {
  const ReservationDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedReservationIdProvider);
    
    if (selectedId == null) {
      return Container(
        color: AppColors.bg,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.event_note_outlined, size: 64, color: AppColors.ashGrey),
              SizedBox(height: 16),
              Text(
                'Select a reservation to view details',
                style: TextStyle(color: AppColors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    final reservationsAsync = ref.watch(allReservationsProvider);
    
    return reservationsAsync.when(
      data: (list) {
        final reservation = list.firstWhere((r) => r.reservationID == selectedId);
        final customerAsync = ref.watch(customerInfoProvider(reservation.customerID));
        final detailsAsync = ref.watch(reservationDetailsProvider(selectedId));

        return Container(
          color: AppColors.bg,
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                customerAsync.when(
                  data: (customer) => detailsAsync.when(
                    data: (details) => _buildHeader(reservation, customer, details),
                    loading: () => _buildHeader(reservation, customer, []),
                    error: (_, __) => _buildHeader(reservation, customer, []),
                  ),
                  loading: () => const CircularProgressIndicator(),
                  error: (err, _) => Text('Error loading customer: $err'),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Divider(height: 1),
                ),

                // Table Details
                const Row(
                  children: [
                    Icon(Icons.table_restaurant_outlined, color: AppColors.primary, size: 20),
                    SizedBox(width: 12),
                    Text('Booking Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
                  ],
                ),
                const SizedBox(height: 24),
                
                detailsAsync.when(
                  data: (details) {
                    if (details.isEmpty) return const Text('No table information found');
                    return Column(
                      children: details.map((d) => _buildDetailItem(context, ref, d)).toList(),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Text('Error loading details: $err'),
                ),

                if (reservation.specialRequest.isNotEmpty) ...[
                  const SizedBox(height: 32),
                  const Text('Special Request', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.blackGrey)),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                    ),
                    child: Text(reservation.specialRequest),
                  ),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }

  Widget _buildHeader(ReservationListItem reservation, CustomerModel customer, List<ReservationDetailItem> details) {
    final isCancelled = details.isNotEmpty && details.every((d) => d.reservationStatus == 3);
    final statusText = isCancelled ? 'CANCELLED' : 'CONFIRMED';
    final statusColor = isCancelled ? Colors.red : AppColors.success;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: statusColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 4, height: 4, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text(statusText, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${customer.firstName} ${customer.lastName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(customer.phone, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(width: 12),
                const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(customer.address, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderInfoBox(
              label: 'DATE',
              value: DateFormat('MMM dd, yyyy').format(reservation.reservationDate),
            ),
            const SizedBox(width: 16),
            _buildHeaderInfoBox(
              label: 'TIME',
              value: DateFormat('hh:mm a').format(reservation.reservationDate),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderInfoBox({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, WidgetRef ref, ReservationDetailItem detail) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InfoBox(label: 'TABLE', value: detail.tableNumber, icon: Icons.tag),
              const SizedBox(width: 32),
              InfoBox(label: 'GUESTS', value: detail.noOfPersons.toString(), icon: Icons.people_outline),
              const Spacer(),
              StatusPill(status: detail.reservationStatus == 1 ? 'Confirmed' : 'Cancelled'),
            ],
          ),
          const SizedBox(height: 32),
          if(detail.reservationStatus == 1)
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement Seat Guest
                      Toaster.info(context: context, message: 'Seat Guest function coming soon', isLandscape: true);
                    },
                    icon: const Icon(Icons.chair_outlined),
                    label: const Text('Seat Guest'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () => _showCancelDialog(context, ref, detail),
                    icon: const Icon(Icons.cancel_outlined),
                    label: const Text('Cancel Reservation'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context, WidgetRef ref, ReservationDetailItem detail) {
    final reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Reservation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you sure you want to cancel the reservation for ${detail.tableNumber}?'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Reason for Cancellation',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.isEmpty) {
                Toaster.warning(context: context, message: 'Please provide a reason', isLandscape: true);
                return;
              }
              await ref.read(cancelReservationStateProvider.notifier).cancel(
                detail.reservationDetailsID, 
                reasonController.text,
              );
              if (context.mounted) {
                final state = ref.read(cancelReservationStateProvider);
                if (state.hasError) {
                  Toaster.error(context: context, message: 'Cancellation failed: ${state.error}', isLandscape: true);
                } else {
                  Toaster.success(context: context, message: 'Reservation cancelled successfully', isLandscape: true);
                  Navigator.pop(context);
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirm Cancellation', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const InfoBox({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class StatusPill extends StatelessWidget {
  final String status;
  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isConfirmed = status.toLowerCase() == 'confirmed';
    final color = isConfirmed ? AppColors.success : Colors.red;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      ),
    );
  }
}
