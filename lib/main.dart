import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_pharm/screens/home_screen.dart';
import 'package:star_pharm/screens/sign_up_screen.dart';
import 'package:star_pharm/screens/sing_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.teal,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          primaryTextTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              labelLarge: TextStyle(fontSize: 20),
              labelMedium: TextStyle(fontSize: 16))),
      home: HomeScreen(),
    );
  }
}
