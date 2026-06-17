import 'package:flutter/material.dart';

class AppSpacing {
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppGap {
  static const SizedBox hXs = SizedBox(width: AppSpacing.xs);
  static const SizedBox hS = SizedBox(width: AppSpacing.s);
  static const SizedBox hM = SizedBox(width: AppSpacing.m);
  static const SizedBox hL = SizedBox(width: AppSpacing.l);
  static const SizedBox hXl = SizedBox(width: AppSpacing.xl);

  static const SizedBox vXs = SizedBox(height: AppSpacing.xs);
  static const SizedBox vS = SizedBox(height: AppSpacing.s);
  static const SizedBox vM = SizedBox(height: AppSpacing.m);
  static const SizedBox vL = SizedBox(height: AppSpacing.l);
  static const SizedBox vXl = SizedBox(height: AppSpacing.xl);
}
