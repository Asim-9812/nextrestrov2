import 'package:flutter/material.dart';
import 'landscape/shift_landscape_page.dart';
import 'potrait/shift_potrait_page.dart';

class ShiftPage extends StatelessWidget {
  const ShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const ShiftLandscapePage();
        } else {
          return const ShiftPotraitPage();
        }
      },
    );
  }
}
