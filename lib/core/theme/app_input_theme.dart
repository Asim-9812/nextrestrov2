import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppInputTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textSecondary,
    suffixIconColor: AppColors.textSecondary,
    labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
    hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
    errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.accentError),
    floatingLabelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: AppColors.textQuaternary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: AppColors.textQuaternary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: AppColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: AppColors.accentError),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.accentError),
    ),
  );
}
