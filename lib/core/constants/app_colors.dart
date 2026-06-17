import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFFFD872A);
  static const Color primary2 = Color(0xFFFFEEE0);
  static const Color splash = Color(0xFFFF8303);

  // Background & Surfaces
  static const Color bg = Color(0xFFFFF9F4);
  static const Color white = Color(0xFFFFFFFF);
  
  // Neutral Colors (Greyscale)
  static const Color black = Color(0xFF030E18);
  static const Color blackGrey = Color(0xFF353E46);
  static const Color grey = Color(0xFF686E74);
  static const Color lightGrey = Color(0xFF9A9FA3);
  static const Color ashGrey = Color(0xFFCDCFD1);
  
  // Border (FD872A at 15% opacity)
  static final Color border = const Color(0xFFFD872A).withOpacity(0.15);
  
  // Feedback
  static const Color error = Colors.red;
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);
  static const Color info = Color(0xFF007AFF);
}
