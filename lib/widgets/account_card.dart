import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String username;
  final String birthdate;
  final String gender;
  final String phone;
  final String email;
  final String location;

  const AccountCard({super.key, 
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
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://biturbo.az/flutter/doc1.jpg'),
                    radius: 30,
                  ),
                 const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(username),
                    ],
                  ),
                 const Spacer(),
                  IconButton(
                    icon:const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
             const Divider(height: 20, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       const Text('Tam ad'),
                       const SizedBox(height: 5),
                        Text(name,
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      const  Text('Doğum Tarixi'),
                      const  SizedBox(height: 5),
                        Text(birthdate,
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      const  Text('Cinsiyyət'),
                      const  SizedBox(height: 5),
                        Text(gender,
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       const Text('Phone'),
                       const SizedBox(height: 5),
                        Text(phone,
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       const Text('Email'),
                      const  SizedBox(height: 5),
                        Text(email,
                            style:const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      const  Text('Location'),
                      const  SizedBox(height: 5),
                        Text(location,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
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
          onTap: () {
            
          },
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

  const SectionCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
