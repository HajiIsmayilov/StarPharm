import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_pharm/screens/camera_screen.dart';
import 'package:star_pharm/screens/change_password_screen.dart';
import 'package:star_pharm/screens/profile_screen.dart';
import '../shared/shared_strings.dart';
import '../widgets/account_card.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  final String username = 'Kazim Kazimli';
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
       title: Text(
          SharedStrings.account,
          style: Theme.of(context).primaryTextTheme.headlineLarge,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
              ),
              CardSection(
                  label: SharedStrings.receipts,
                  onTap: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.camera);

//Send
                    setState(() {
                      if (pickedFile != null) {
                        // file = File(pickedFile.path);
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => ImageShowerScreen(
                        //           imagePath: pickedFile.path)),
                        // );
                      } else {
                        print('No image selected');
                      }
                    });
                  }),
              CardSection(
                  label: SharedStrings.passwordAdjustment,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()),
                    );
                  }),
              CardSection(label: SharedStrings.logOut, onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
