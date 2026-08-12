import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.buttonPrimary,
      disabledForegroundColor: AppColors.textDisabled,
      disabledBackgroundColor: AppColors.buttonBg,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: AppTextStyles.button,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.buttonPrimary,
      side: const BorderSide(color: AppColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      textStyle: AppTextStyles.button.copyWith(color: AppColors.buttonPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
