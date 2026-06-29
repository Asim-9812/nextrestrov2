import 'package:flutter/material.dart';
import 'portrait/forgot_password_portrait_page.dart';
import 'landscape/forgot_password_landscape_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const ForgotPasswordLandscapePage();
        } else {
          return const ForgotPasswordPortraitPage();
        }
      },
    );
  }
}
