import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'routes/route.dart';
import 'utilities/internet_checker_v2.dart';
import 'services/firebase_notification_service.dart';
import 'theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  var app = GetMaterialApp(
    theme: AppTheme().theme,
    navigatorKey: Grock.navigationKey,
    scaffoldMessengerKey: Grock.scaffoldMessengerKey,
    initialRoute: RoutePath.signIn,
    getPages: PageList().pages,
  );

  runApp(app);
  InternetCheckerV2().Check();
}
