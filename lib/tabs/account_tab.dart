import 'package:flutter/material.dart';
import '../widgets/account_card.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Malikoğlu Anar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AccountCard(
          name: 'Malikoğlu Anar',
          username: '@mrAnar',
          birthdate: '11 Yanvar 2024',
          gender: 'Kişi',
          phone: '018868**37',
          email: 'singh@gmail.com',
          location: 'India',
        ),
      ),
    );
  }
}
