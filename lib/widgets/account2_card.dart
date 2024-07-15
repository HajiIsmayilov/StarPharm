import 'package:flutter/material.dart';

class Account2Card extends StatelessWidget {
  final String fullName;
  final String username;
  final String birthdate;
  final String gender;
  final String phone;
  final String email;
  final String location;

  const Account2Card({
    super.key,
    required this.fullName,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.phone,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _upSide(),
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
              _cardItem('Tam ad', fullName),
              _cardItem('Cinsiyyət', gender),
              _cardItem('Email', email),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardItem('Doğum Tarixi', birthdate),
              _cardItem('Phone', phone),
              _cardItem('Location', location),
            ],
          )
        ],
      ),
    );
  }

  Widget _upSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://biturbo.az/flutter/doc1.jpg'),
            radius: 30,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fullName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(username),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {},
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
}

class CardSection2 extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CardSection2({
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
