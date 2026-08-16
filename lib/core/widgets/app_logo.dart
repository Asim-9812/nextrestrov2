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
    this.size = 40,
    this.color,
    this.pawColor,
  });

  @override
  Widget build(BuildContext context) {
    final logoColor = color ?? AppColors.primary;
    
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The "D" Icon with Paw
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: logoColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size * 0.2),
                bottomLeft: Radius.circular(size * 0.2),
                topRight: Radius.circular(size * 0.5),
                bottomRight: Radius.circular(size * 0.5),
              ),
            ),
            child: Center(
              child: Icon(
                FontAwesomeIcons.paw,
                color: pawColor ?? Colors.black,
                size: size * 0.6,
              ),
            ),
          ),
          SizedBox(width: size * 0.1),
          // The "ivine pets" Text
          Flexible(
            fit: FlexFit.loose,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Text(
                'Divine pets',
                style: AppTextStyles.h2.copyWith(
                  color: logoColor,
                  fontSize: size * 0.85,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
