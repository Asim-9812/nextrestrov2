import 'package:flutter/material.dart';
import 'package:nextrestro/features/branch/presentation/pages/landscape/branch_landscape_page.dart';
import 'package:nextrestro/features/branch/presentation/pages/portrait/branch_portrait_page.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const BranchLandscapePage();
          } else {
            return const BranchPortraitPage();
          }
        },
      ),
    );
  }
}
