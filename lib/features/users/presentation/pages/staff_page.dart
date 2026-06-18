import 'package:flutter/material.dart';
import 'package:nextrestro/features/users/presentation/pages/landscape/staff_landscape_page.dart';
import 'package:nextrestro/features/users/presentation/pages/portrait/staff_portrait_page.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const StaffLandscapePage();
          } else {
            return const StaffPortraitPage();
          }
        },
      ),
    );
  }
}
