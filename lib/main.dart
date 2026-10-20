import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mobile/core/theme/app_theme.dart';
import 'mobile/core/theme/theme_controller.dart';
import 'mobile/models/current_user.dart';
import 'mobile/screens/splash/splash_screen.dart';
import 'mobile/services/api_service.dart';
import 'mobile/services/notification_service.dart';
import 'mobile/services/socket_service.dart';
import 'mobile/services/background_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Make status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness:
          Brightness.dark, // Dark icons (for light backgrounds)
      statusBarBrightness:
          Brightness.light, // iOS: Light background / Dark text
    ),
  );
  await ThemeController.instance.restore();
  await CurrentUser.restore();
  await ApiService.instance.restoreToken();
  await NotificationService.instance.init();
  await BackgroundNotificationService.instance
      .initializeWorkManager(); // closed-app responder alerts (Android)
  SocketService.instance
      .connect(); // one shared real-time connection for the whole app

  runApp(const CrisisFlowApp());
  await NotificationService.instance.requestPermissionExplicitly();
}

class CrisisFlowApp extends StatelessWidget {
  const CrisisFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'CrisisFlow',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeController.instance.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
