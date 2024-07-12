import 'package:flutter/material.dart';
//import 'package:star_pharm/screens/sign_up_screen.dart';

import '../validations/regexes.dart';
import '../widgets/jpg_image.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  static const String _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const JpgImage(url: _url, width: _imgWidth),
              const SizedBox(height: 10),
              TextFormField(
                validator: ValidationRules().emailValidation,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
