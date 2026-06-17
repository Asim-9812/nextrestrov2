import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';

class ReservationDetailPotraitPage extends ConsumerWidget {
  const ReservationDetailPotraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedReservationIdProvider);
    
    if (selectedId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Reservation Details', style: TextStyle(fontSize: 16))),
        body: const Center(child: Text('No reservation selected', style: TextStyle(fontSize: 13))),
      );
    }

    final reservationsAsync = ref.watch(allReservationsProvider);
    
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Reservation Details', style: TextStyle(fontSize: 16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        toolbarHeight: 48,
      ),
      body: reservationsAsync.when(
        data: (list) {
          final reservation = list.firstWhere((r) => r.reservationID == selectedId);
          final customerAsync = ref.watch(customerInfoProvider(reservation.customerID));
          final detailsAsync = ref.watch(reservationDetailsProvider(selectedId));

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Customer Header
                customerAsync.when(
                  data: (customer) => detailsAsync.when(
                    data: (details) => _buildHeader(reservation, customer, details),
                    loading: () => _buildHeader(reservation, customer, []),
                    error: (_, __) => _buildHeader(reservation, customer, []),
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Text('Error loading customer: $err', style: const TextStyle(fontSize: 13)),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),

                const Row(
                  children: [
                    Icon(Icons.table_restaurant_outlined, color: AppColors.primary, size: 18),
                    SizedBox(width: 8),
                    Text('Booking Information', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
                  ],
                ),
                const SizedBox(height: 16),
                
                detailsAsync.when(
                  data: (details) {
                    if (details.isEmpty) return const Text('No table information found', style: TextStyle(fontSize: 13));
                    return Column(
                      children: details.map((d) => _buildDetailItem(context, ref, d)).toList(),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Text('Error loading details: $err', style: const TextStyle(fontSize: 13)),
                ),

                if (reservation.specialRequest.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const Text('Special Request', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.blackGrey)),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                    ),
                    child: Text(reservation.specialRequest, style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 13))),
      ),
    );
  }

  Widget _buildHeader(ReservationListItem reservation, CustomerModel customer, List<ReservationDetailItem> details) {
    final isCancelled = details.isNotEmpty && details.every((d) => d.reservationStatus == 3);
    final statusText = isCancelled ? 'CANCELLED' : 'CONFIRMED';
    final statusColor = isCancelled ? Colors.red : AppColors.success;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: statusColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 4, height: 4, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Text(statusText, style: TextStyle(color: statusColor, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '${customer.firstName} ${customer.lastName}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.phone_outlined, size: 14, color: Colors.grey),
            const SizedBox(width: 6),
            Text(customer.phone, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
            const SizedBox(width: 6),
            Expanded(child: Text(customer.address, style: const TextStyle(color: Colors.grey, fontSize: 13))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildHeaderInfoBox(
                label: 'DATE',
                value: DateFormat('MMM dd, yyyy').format(reservation.reservationDate),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildHeaderInfoBox(
                label: 'TIME',
                value: DateFormat('hh:mm a').format(reservation.reservationDate),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderInfoBox({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn('TABLE', detail.tableNumber, Icons.tag),
              _buildInfoColumn('GUESTS', detail.noOfPersons.toString(), Icons.people_outline),
              _buildStatusPill(detail.reservationStatus == 1 ? 'Confirmed' : 'Cancelled'),
            ],
          ),
          if(detail.reservationStatus == 1) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Toaster.info(context: context, message: 'Seat Guest function coming soon', isLandscape: false);
                      },
                      icon: const Icon(Icons.chair_outlined, size: 16),
                      label: const Text('Seat Guest', style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: OutlinedButton.icon(
                      onPressed: () => _showCancelDialog(context, ref, detail),
                      icon: const Icon(Icons.cancel_outlined, size: 16),
                      label: const Text('Cancel', style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Row(
          children: [
            Icon(icon, size: 14, color: AppColors.primary),
            const SizedBox(width: 4),
            Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusPill(String status) {
    final isConfirmed = status.toLowerCase() == 'confirmed';
    final color = isConfirmed ? AppColors.success : Colors.red;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showCancelDialog(BuildContext context, WidgetRef ref, ReservationDetailItem detail) {
    final reasonController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Reservation', style: TextStyle(fontSize: 16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you sure you want to cancel the reservation for ${detail.tableNumber}?', style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 12),
            TextField(
              controller: reasonController,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                labelText: 'Reason for Cancellation',
                labelStyle: TextStyle(fontSize: 13),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back', style: TextStyle(fontSize: 13))),
          ElevatedButton(
            onPressed: () async {
              if (reasonController.text.isEmpty) {
                Toaster.warning(context: context, message: 'Please provide a reason', isLandscape: false);
                return;
              }
              await ref.read(cancelReservationStateProvider.notifier).cancel(
                detail.reservationDetailsID, 
                reasonController.text,
              );
              if (context.mounted) {
                final state = ref.read(cancelReservationStateProvider);
                if (state.hasError) {
                  Toaster.error(context: context, message: 'Cancellation failed: ${state.error}', isLandscape: false);
                } else {
                  Toaster.success(context: context, message: 'Reservation cancelled successfully', isLandscape: false);
                  Navigator.pop(context);
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
