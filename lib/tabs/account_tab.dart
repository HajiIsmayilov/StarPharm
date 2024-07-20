import 'package:flutter/material.dart';
import 'package:star_pharm/screens/camera_screen.dart';
import 'package:star_pharm/screens/change_password_screen.dart';
import 'package:star_pharm/screens/profile_screen.dart';
import '../widgets/account_card.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  final String username = 'Kazim Kazimli';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              AccountCard(
                fullName: 'Kazim Kazimli',
                username: '@mr.Kazim',
                birthdate: '02.02.2020',
                gender: 'Kisi',
                phone: '0702111111',
                email: 'KazimKzm@gmail.com',
                location: 'Azerbaijan',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
              CardSection(
                  label: AccountTabStrings.receipts,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const CameraScreen()),
                    );
                  }),
              CardSection(
                  label: AccountTabStrings.passwordAdjustment,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()),
                    );
                  }),
              CardSection(label: AccountTabStrings.logOut, onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTabStrings {
  static const String receipts = 'Reseptlər';
  static const String passwordAdjustment = 'Şifrənin tənzimlənməsi';
  static const String logOut = 'Hesabınızdan çıxın';
}
