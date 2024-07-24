import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_pharm/screens/home_screen.dart';
import 'package:star_pharm/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: const HomeScreen(),
    );
  }
}
