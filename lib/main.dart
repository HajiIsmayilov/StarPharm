import 'package:flutter/material.dart';
import 'package:star_pharm/screens/forgot_password_screen.dart';
import 'package:star_pharm/screens/home_screen.dart';
import 'package:star_pharm/screens/sign_up_screen.dart';
import 'package:star_pharm/screens/sing_in_screen.dart';
import 'package:star_pharm/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

