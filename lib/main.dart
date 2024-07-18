import 'package:flutter/material.dart';
import 'package:star_pharm/screens/home_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}
