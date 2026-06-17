import 'package:flutter/material.dart';
import 'landscape/login_landscape_page.dart';
import 'portrait/login_portrait_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.landscape
        ? const LoginLandscapePage()
        : const LoginPortraitPage();
  }
}
