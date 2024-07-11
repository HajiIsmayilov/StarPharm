import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/jpg_image.dart';

import '../widgets/custom_rectangle_border_button.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});
  static const _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _formKey = GlobalKey<FormState>();
  static bool _obscureText = true;
  static const double _radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: SingInScreenPaddings._horizontalPadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const JpgImage(
                      url: SingInScreen._url, width: SingInScreen._imgWidth),
                  _space(),
                  const Text(
                    SingInScreenStrings._logIn,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _space(),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: SingInScreenStrings._email,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _space(),
                  TextFormField(
                      obscureText: _obscureText,
                      
                      decoration: InputDecoration(
                        labelText: SingInScreenStrings._password,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(_radius),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(visibilityData()),
                            onPressed: update,
                          ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        SingInScreenStrings._forgotPassword,
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomRectangleBorderButton(
                      title: SingInScreenStrings._logIn,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    children: [
                      const Text(SingInScreenStrings._dontHaveAccount),
                      TextButton(
                        onPressed: () {},
                        child: const Text(SingInScreenStrings._signUp),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 16);

  IconData visibilityData() {
    return _obscureText ? Icons.visibility_off : Icons.visibility;
  }

  void update() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

class SingInScreenStrings {
  static const String _logIn = 'Log in';
  static const String _signUp = 'Sign up';
  static const String _email = 'Email';
  static const String _password = 'Password';
  static const String _forgotPassword = 'Forgot Password?';
  static const String _dontHaveAccount = 'Don\'t have an account?';
}

class SingInScreenPaddings {
  static const EdgeInsets _verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets _horizontalPadding =
      EdgeInsets.symmetric(horizontal: 12);
}
