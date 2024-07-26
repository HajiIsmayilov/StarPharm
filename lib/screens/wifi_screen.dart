import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:star_pharm/shared/shared_strings.dart';

class WifiScreen extends StatelessWidget {
  const WifiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/lottie/wifi.json',
                repeat: true,
                width: 300,
                height: 300,
              ),
            ),
            Text(
              SharedStrings.noInternet,
              style: Theme.of(context).primaryTextTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
