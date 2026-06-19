import 'package:flutter/material.dart';
import 'package:nextrestro/features/department/presentation/pages/landscape/department_landscape_page.dart';
import 'package:nextrestro/features/department/presentation/pages/portrait/department_portrait_page.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const DepartmentLandscapePage();
          } else {
            return const DepartmentPortraitPage();
          }
        },
      ),
    );
  }
}
