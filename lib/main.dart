import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  runApp(const App());

  InternetCheckerV2().Check();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      initialRoute: RoutePath.signIn,
      routes: ScreenList().getScreens(context),
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
    );
  }
}
