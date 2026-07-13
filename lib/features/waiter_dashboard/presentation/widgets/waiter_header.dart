import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

class WaiterHeader extends ConsumerWidget {
  final String title;

  const WaiterHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftState = ref.watch(shiftManagementControllerProvider);
    final sessionService = ref.watch(sessionServiceProvider);
    final userMap = sessionService.getUser();
    
    // Prefer username for the greeting, fallback to fullName or 'User'
    final String username = userMap?['username'] ?? userMap?['fullName'] ?? 'User';
    final String fullName = userMap?['fullName'] ?? userMap?['username'] ?? 'User';
    final String role = userMap?['role'] ?? 'Waiter';
    final String firstName = username.split(' ').first;

    return Container(
      height: 70,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontFamily: 'Manrope',
                ),
              ),
              shiftState.maybeWhen(
                data: (state) {
                  final shift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
                  if (shift == null) return const Text('No active shift', style: TextStyle(fontSize: 12, color: AppColors.grey));
                  
                  return Text(
                    '${shift.shiftName} • ${TimeFormatter.formatTimeAgo(shift.openingTime)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  );
                },
                orElse: () => const Text('Loading shift...', style: TextStyle(fontSize: 12, color: AppColors.grey)),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // Notifications hidden as requested
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.ashGrey.withValues(alpha: 0.5)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/man.png'),
                      radius: 14,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          fullName,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, height: 1.1),
                        ),
                        Text(
                          role,
                          style: const TextStyle(fontSize: 11, color: AppColors.grey, height: 1.1),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: AppColors.grey),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
