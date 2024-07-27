import 'package:flutter/widgets.dart';

import '../screens/change_password_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/qa_screen.dart';
import '../screens/qa_doctor_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/sing_in_screen.dart';
import '../screens/wifi_screen.dart';

class RoutePath {
  static const String signIn = '/singin';
  static const String signUp = '/singup';
  static const String home = '/home';
  static const String forgotPassword = '/forgotpassword';
  static const String changePassword = '/changePassword';
  static const String profile = '/profile';
  static const String qaDoctor = '/qadoctor';
  static const String notification = '/notification';
  static const String qa = '/qa';
  static const String wifi = '/wifi';
}

//  '/': (context) => const FirstScreen(),
class ScreenList {
  getScreens(BuildContext context) {
    return {
      RoutePath.signIn: (context) => const SignInScreen(),
      RoutePath.signUp: (context) => const SignUpScreen(),
      RoutePath.home: (context) => const HomeScreen(),
      RoutePath.forgotPassword: (context) => const ForgotPasswordScreen(),
      RoutePath.changePassword: (context) => const ChangePasswordScreen(),
      RoutePath.profile: (context) => const ProfileScreen(),
      RoutePath.qaDoctor: (context) => QaDoctorScreen(),
      RoutePath.qa: (context) => QaScreen(),
      RoutePath.notification: (context) => const NotificationsScreen(),
      RoutePath.wifi: (context) => const WifiScreen(),
    };
  }
}
