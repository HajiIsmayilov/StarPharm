import 'package:flutter/material.dart';
import 'package:star_pharm/screens/camera_screen.dart';
import 'package:star_pharm/screens/home_screen.dart';
import 'package:star_pharm/screens/qa2_screen.dart';
import 'package:star_pharm/screens/qa_doctor_screen.dart';
import 'package:star_pharm/screens/qa_screen.dart';
import 'package:star_pharm/screens/sign_up_screen.dart';
import 'package:star_pharm/screens/test_screen.dart';
import 'package:star_pharm/tabs/account_tab.dart';

import 'screens/camera2_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.teal,
          primaryTextTheme: const TextTheme(
              labelLarge: TextStyle(fontSize: 20),
              labelMedium: TextStyle(fontSize: 16))),
      home: HomeScreen(),
    );
  }
}
