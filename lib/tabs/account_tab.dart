import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../routes/route.dart';
import '../shared/shared_strings.dart';
import '../widgets/account_card.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  late File? file;

  @override
  void initState() {
    super.initState();
    file = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FittedBox(
          child: Text(
            SharedStrings.account,
            style: Theme.of(context).primaryTextTheme.headlineLarge,
          ),
        ),
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
                  Get.toNamed(RoutePath.profile);
                },
              ),
              CardSection(
                  label: SharedStrings.receipts,
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    //Send
                  }),
              CardSection(
                  label: SharedStrings.passwordAdjustment,
                  onTap: () {
                    Get.toNamed(RoutePath.changePassword);
                  }),
              CardSection(label: SharedStrings.logOut, onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
