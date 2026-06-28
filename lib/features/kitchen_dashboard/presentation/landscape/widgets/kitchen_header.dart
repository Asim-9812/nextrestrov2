import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';

class KitchenHeader extends ConsumerWidget {
  final String title;

  const KitchenHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftState = ref.watch(shiftControllerProvider);

    return Container(
      height: 60, // Exact match with AdminHeader
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: shiftState.maybeWhen(
              data: (data) {
                final shift = data.$1;
                if (shift == null) return const SizedBox.shrink();

                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.schedule, size: 16, color: AppColors.primary),
                          const SizedBox(width: 8),
                          Text(
                            '${shift.shiftName} • ${TimeFormatter.formatTimeAgo(shift.openingTime)}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
          ),
          const Chip(
            backgroundColor: AppColors.bg,
            side: BorderSide.none,
            avatar: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text(
                'K',
                style: TextStyle(color: AppColors.white, fontSize: 10),
              ),
            ),
            label: Text(
              'Kitchen',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
