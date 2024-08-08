import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_pharm/models/user.dart';

class AccountCard extends StatefulWidget {
  final User? user;
  final VoidCallback? onPressed;

  const AccountCard({
    super.key,
    required this.user,
    required this.onPressed,
  });

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  late File? file;
  @override
  void initState() {
    super.initState();
    file = null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          _upSide(context),
          const Divider(height: 12, thickness: 1),
          _bottomSide(),
          const SizedBox(height: 12)
        ],
      ),
    );
  }

  Widget _bottomSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItem('Tam ad', widget.user?.fullName ?? 'null'),
              _cardItem('Cinsiyyət', widget.user?.gender ?? 'null'),
              _cardItem('Email', widget.user?.email ?? 'null'),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItem('Doğum Tarixi', widget.user?.birthdate ?? 'null'),
              _cardItem('Phone', widget.user?.phone ?? 'null'),
              _cardItem('Location', widget.user?.location ?? 'null'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _upSide(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: InkWell(
            onTap: getImage,
            child: CircleAvatar(
              backgroundImage: _bgImage(file),
              radius: 30,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.user?.fullName ?? 'null',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(widget.user?.username ?? 'null'),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: widget.onPressed,
          ),
        ),
      ],
    );
  }

  Widget _cardItem(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            textAlign: TextAlign.start,
            label,
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Future getImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    //File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected');
        }
      }
    });
  }

  _bgImage(File? file) {
    if (file == null) {
      return const NetworkImage('https://biturbo.az/flutter/doc1.jpg');
    }
    return FileImage(file);
  }
}

class CardSection extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CardSection({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(label, style: const TextStyle(fontSize: 18)),
        ),
        trailing: const Icon(Icons.chevron_right_sharp),
        onTap: onTap,
      ),
    );
  }
}
