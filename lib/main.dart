import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grock/grock.dart';
import 'package:star_pharm/cache/notification_cache.dart';
import 'package:star_pharm/cache/user_cache.dart';
import 'routes/route.dart';
import 'utilities/internet_checker_v2.dart';
import 'services/firebase_notification_service.dart';
import 'theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);

  UserCache().init();

  runApp(const App());

  InternetCheckerV2().Check();
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  void dispose() {
    NotificationCache().close();
    super.dispose();
  }

  void _asyncMethod() async {
    NotificationCache().init();
  }

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
