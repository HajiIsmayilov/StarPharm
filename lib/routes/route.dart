import 'package:get/get.dart';

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

class PageList {
  List<GetPage<dynamic>> pages = [
    GetPage(name: RoutePath.signIn, page: () => const SignInScreen()),
    GetPage(name: RoutePath.signUp, page: () => const SignUpScreen()),
    GetPage(name: RoutePath.home, page: () => const HomeScreen()),
    GetPage(
        name: RoutePath.forgotPassword,
        page: () => const ForgotPasswordScreen()),
    GetPage(
        name: RoutePath.changePassword,
        page: () => const ChangePasswordScreen()),
    GetPage(name: RoutePath.profile, page: () => const ProfileScreen()),
    GetPage(name: RoutePath.qaDoctor, page: () => QaDoctorScreen()),
    GetPage(name: RoutePath.qa, page: () => QaScreen()),
    GetPage(
        name: RoutePath.notification, page: () => const NotificationsScreen()),
    GetPage(name: RoutePath.wifi, page: () => const WifiScreen()),
  ];
}
