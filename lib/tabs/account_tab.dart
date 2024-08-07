import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../cache/user_cache.dart';
import '../models/user.dart';
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
  late User? user;

  @override
  void initState() {
    user = UserCache.getUser();
    file = null;
    super.initState();
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
                user: user!,
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePath.profile);
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
                    Navigator.of(context).pushNamed(RoutePath.changePassword);
                  }),
              CardSection(label: SharedStrings.logOut, onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
