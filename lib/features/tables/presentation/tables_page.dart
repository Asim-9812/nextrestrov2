import 'package:flutter/material.dart';
import 'landscape/tables_landscape_page.dart';
import 'potrait/tables_potrait_page.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const TablesLandscapePage();
        } else {
          return const TablesPotraitPage();
        }
      },
    );
  }
}
