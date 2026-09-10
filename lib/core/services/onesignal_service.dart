import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart'; // To access navigatorKey

class OneSignalService {
  static const String _appId = "a320a637-fe26-4694-bbc2-43dc677ba436";
  static const String _dialogShownKey = "onesignal_verification_dialog_shown";

  static void init() {
    debugPrint("OneSignal: Initializing...");
    
    // 1. Set Debug Level
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // 2. Setup Listeners BEFORE Initialize (recommended for some edge cases)
    
    // Foreground Notification Listener
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      debugPrint("OneSignal: !!! FOREGROUND NOTIFICATION RECEIVED !!!");
      debugPrint("OneSignal: Title: ${event.notification.title}");
      debugPrint("OneSignal: Body: ${event.notification.body}");
      
      // Force display the notification banner
      event.notification.display(); 
    });

    // Notification Click Listener
    OneSignal.Notifications.addClickListener((event) {
      debugPrint("OneSignal: Notification clicked: ${event.notification.title}");
    });

    // Subscription Observer
    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint("OneSignal: Subscription ID changed: ${state.current.id}");
      debugPrint("OneSignal: Is Subscribed: ${state.current.optedIn}");
      if (state.current.id != null) {
        _checkAndShowVerificationDialog(state.current.id);
      }
    });

    // 3. Initialize
    OneSignal.initialize(_appId);

    // 4. Automatically request push permission during initialization
    OneSignal.Notifications.requestPermission(true).then((accepted) {
      debugPrint("OneSignal: Permission request completed. Accepted: $accepted");
    });

    // 5. Force check permissions and registration
    _forceCheckStatus();
  }

  static Future<void> _forceCheckStatus() async {
    // Wait a bit for SDK to settle
    await Future.delayed(const Duration(seconds: 2));
    
    final subId = OneSignal.User.pushSubscription.id;
    final hasPermission = await OneSignal.Notifications.permission;
    
    debugPrint("OneSignal: Periodic Status Check:");
    debugPrint("OneSignal:   Subscription ID: $subId");
    debugPrint("OneSignal:   Has Permission: $hasPermission");

    if (subId != null && !hasPermission) {
      debugPrint("OneSignal: Permission not granted, triggering prompt...");
      // For testing purposes, we can trigger the prompt here if not granted
      // but following the ai-prompt guidelines, we use the dialog.
      _checkAndShowVerificationDialog(subId);
    }
  }

  static Future<void> _checkAndShowVerificationDialog(String? subscriptionId) async {
    if (subscriptionId == null || subscriptionId.startsWith("local-")) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_dialogShownKey) ?? false) return;

    // Show dialog via navigatorKey context
    _waitForContextAndShowDialog();
  }

  static Future<void> _waitForContextAndShowDialog() async {
    while (navigatorKey.currentContext == null) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    final context = navigatorKey.currentContext!;
    if (!context.mounted) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_dialogShownKey) ?? false) return;
    
    await prefs.setBool(_dialogShownKey, true);
    
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Notifications Integrated!"),
          content: const Text("Tap 'Got it' to enable pet updates and reminders."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Explicitly request permission here
                OneSignal.Notifications.requestPermission(true);
              },
              child: const Text("Got it"),
            ),
          ],
        ),
      );
    }
  }

  static void login(String externalId) => OneSignal.login(externalId);
  static void logout() => OneSignal.logout();
}
