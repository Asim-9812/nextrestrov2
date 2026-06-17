import 'package:flutter/material.dart';
import '../landscape/menu_landscape_page.dart';
import '../portrait/menu_portrait_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return const MenuLandscapePage();
        } else {
          return const MenuPortraitPage();
        }
      },
    );
  }
}
