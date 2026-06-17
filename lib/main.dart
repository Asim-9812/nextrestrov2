import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Initialize Hive
    await Hive.initFlutter();
    
    // Initialize Session Service
    final sessionService = SessionService();
    await sessionService.init();

    // Set to true to enable device preview for testing different screen sizes
    const bool enableDevicePreview = true;
    
    runApp(
      ProviderScope(
        overrides: [
          sessionServiceProvider.overrideWithValue(sessionService),
        ],
        child: const MyApp(enableDevicePreview: enableDevicePreview),
      ),
    );
  } catch (e) {
    debugPrint('Initialization Error: $e');
  }
}
