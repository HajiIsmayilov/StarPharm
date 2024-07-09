import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String username;
  final String birthdate;
  final String gender;
  final String phone;
  final String email;
  final String location;

  AccountCard({
    required this.name,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.phone,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://biturbo.az/flutter/doc1.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(username),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
              Divider(height: 20, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Tam ad'),
                        SizedBox(height: 5),
                        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Doğum Tarixi'),
                        SizedBox(height: 5),
                        Text(birthdate, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Cinsiyyət'),
                        SizedBox(height: 5),
                        Text(gender, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Phone'),
                        SizedBox(height: 5),
                        Text(phone, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Email'),
                        SizedBox(height: 5),
                        Text(email, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Location'),
                        SizedBox(height: 5),
                        Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SectionCard(
          title: 'Reseptlər',
          onTap: () {},
        ),
        SectionCard(
          title: 'Şifrənin tənzimlənməsi',
          onTap: () {},
        ),
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  SectionCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
