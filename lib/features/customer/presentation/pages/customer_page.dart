import 'package:flutter/material.dart';
import 'package:nextrestro/features/customer/presentation/pages/landscape/customer_landscape_page.dart';
import 'package:nextrestro/features/customer/presentation/pages/portrait/customer_portrait_page.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return const CustomerLandscapePage();
          } else {
            return const CustomerPortraitPage();
          }
        },
      ),
    );
  }
}
