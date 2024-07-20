import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  final String fullName;
  final String username;
  final String birthdate;
  final String gender;
  final String phone;
  final String email;
  final String location;
  final VoidCallback? onPressed;

  const AccountCard({
    super.key,
    required this.fullName,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.phone,
    required this.email,
    required this.location,
    required this.onPressed,
  });

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  late File? file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    file = null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _upSide(context),
            const Divider(height: 20, thickness: 1),
            _bottomSide()
          ],
        ),
      ),
    );
  }

  Widget _bottomSide() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItem('Tam ad', widget.fullName),
              _cardItem('Cinsiyyət', widget.gender),
              _cardItem('Email', widget.email),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItem('Doğum Tarixi', widget.birthdate),
              _cardItem('Phone', widget.phone),
              _cardItem('Location', widget.location),
            ],
          )
        ],
      ),
    );
  }

  Widget _upSide(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                type: FileType.image,
                allowedExtensions: ['jpeg', 'jpg', 'png'],
              );

              String path = result!.paths[0] ?? '';

              // setState(() {
              //   file = File(path);
              // });

            },
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
              widget.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(widget.username),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.edit, color: Theme.of(context).primaryColor),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }

  Widget _cardItem(String label, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          label,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
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
