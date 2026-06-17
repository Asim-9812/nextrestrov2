import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class DropdownSubItem {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  DropdownSubItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
}

class MenuSidebarDropdown extends StatelessWidget {
  final String icon;
  final String label;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<DropdownSubItem> items;

  const MenuSidebarDropdown({
    super.key,
    required this.icon,
    required this.label,
    required this.isExpanded,
    required this.onToggle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Iconify(
                  icon,
                  size: 20,
                  color: AppColors.blackGrey,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.blackGrey,
                      fontSize: 14,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 20,
                  color: AppColors.blackGrey,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          ...items.map((item) => InkWell(
                onTap: item.onTap,
                child: Container(
                  margin: const EdgeInsets.only(left: 44, right: 12, top: 2, bottom: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: item.isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        item.label,
                        style: TextStyle(
                          color: item.isSelected ? AppColors.primary : AppColors.grey,
                          fontSize: 13,
                          fontWeight: item.isSelected ? FontWeight.bold : FontWeight.normal,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                ),
              )),
      ],
    );
  }
}
