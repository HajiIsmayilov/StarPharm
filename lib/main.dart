import 'package:flutter/material.dart';
import 'package:star_pharm/screens/camera_screen.dart';
import 'package:star_pharm/screens/home_screen.dart';
import 'package:star_pharm/tabs/account_tab.dart';

import 'screens/camera2_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccountTab(),
    );
  }
}