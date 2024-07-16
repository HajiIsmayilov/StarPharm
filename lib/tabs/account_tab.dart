import 'package:flutter/material.dart';
import '../screens/camera2_screen.dart';
import '../widgets/account2_card.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kazim Kazimli'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Account2Card(
                fullName: 'Kazim Kazimli',
                username: '@mr.Kazim',
                birthdate: '02.02.2020',
                gender: 'Kisi',
                phone: '0702111111',
                email: 'KazimKzm@gmail.com',
                location: 'Azerbaijan',
              ),
              CardSection2(
                  label: 'Reseptlər',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const Camera2Screen()),
                    );
                  }),
              CardSection2(label: 'Şifrənin tənzimlənməsi', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
