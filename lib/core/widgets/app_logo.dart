import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? pawColor;

  const AppLogo({
    super.key,
    this.size = 150,
    this.color,
    this.pawColor,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icons/banner_logo.png',
      width: size,
      fit: BoxFit.contain,
    );
  }
}
