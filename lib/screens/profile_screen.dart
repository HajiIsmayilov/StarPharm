import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = 'Malikoğlu Anar';
  String username = '@mrAnar';
  String birthDate = '11 Yanvar 2024';
  String gender = 'Kişi';
  String phone = '018868**37';
  String email = 'singh@gmail.com';
  String location = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: fullName,
                decoration: const InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => fullName = value!,
              ),
              TextFormField(
                initialValue: username,
                decoration: const InputDecoration(labelText: 'Username'),
                onSaved: (value) => username = value!,
              ),
              TextFormField(
                initialValue: birthDate,
                decoration: const InputDecoration(labelText: 'Birth Date'),
                onSaved: (value) => birthDate = value!,
              ),
              TextFormField(
                initialValue: gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                onSaved: (value) => gender = value!,
              ),
              TextFormField(
                initialValue: phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (value) => phone = value!,
              ),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                initialValue: location,
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (value) => location = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the edited information
                    setState(() {});
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
