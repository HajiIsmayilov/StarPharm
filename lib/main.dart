import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grock/grock.dart';

import 'package:star_pharm/screens/sing_in_screen.dart';
import 'package:star_pharm/services/firebase_notification_service.dart';
import 'package:star_pharm/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: const SignInScreen(),
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
    );
  }
}
