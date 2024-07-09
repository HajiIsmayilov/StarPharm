import 'package:flutter/material.dart';
import '../widgets/account_card.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Malikoğlu Anar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
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
