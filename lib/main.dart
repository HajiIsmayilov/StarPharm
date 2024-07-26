import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:star_pharm/routes/route.dart';
import 'services/firebase_notification_service.dart';
import 'theme/theme.dart';
import 'utilities/internet_checker.dart';

void main() async {
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

  await InternetChecker().init();
}
