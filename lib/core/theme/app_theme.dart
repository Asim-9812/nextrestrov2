import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.h1,
      headlineMedium: AppTextStyles.h2,
      headlineSmall: AppTextStyles.h3,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),
    elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppInputTheme.lightInputDecorationTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.primary, size: 28),
      actionsIconTheme: const IconThemeData(color: AppColors.primary, size: 28),
      titleTextStyle: AppTextStyles.h3.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: AppColors.primary,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.white;
        return null;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return Colors.transparent;
      }),
    ),
  );
}
