import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/custom_rectangle_border_button.dart';

import '../widgets/jpg_image.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String _url = 'assets/images/health.jpg';
  static const double _cardHeight = 640;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          JpgImage(
            url: 'assets/images/health.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: SizedBox(
              height: _cardHeight,
              child: Card(
                child: Padding(
                  padding: SingUpScreenPaddings._horizontalPadding,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            SingUpScreenStrings._signUp,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _space(),
                          TextFormField(
                            validator: ValidationRules().userNameValidation,
                            decoration: const InputDecoration(
                              labelText: SingUpScreenStrings._username,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _space(),
                          TextFormField(
                            validator: ValidationRules().emailValidation,
                            decoration: const InputDecoration(
                              labelText: SingUpScreenStrings._email,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _space(),
                          TextFormField(
                            validator: ValidationRules().phoneValidation,
                            decoration: const InputDecoration(
                              labelText: SingUpScreenStrings._phone,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          _space(),
                          TextFormField(
                            validator: ValidationRules().passwordValidation,
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              labelText: SingUpScreenStrings._password,
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                          ),
                          _space(),
                          TextFormField(
                            validator: _validateRule,
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              labelText: SingUpScreenStrings._confirmPassword,
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.visibility_off),
                            ),
                          ),
                          _space(),
                          SizedBox(
                            width: double.infinity,
                            child: CustomRectangleBorderButton(
                              title: SingUpScreenStrings._signUp,
                              onPressed: () {
                                _validate(context);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(SingUpScreenStrings._haveAccount),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  SingUpScreenStrings._logIn,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String? _validateRule(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validate(context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  SizedBox _space() => const SizedBox(height: 16);
}

class SingUpScreenStrings {
  static const String _logIn = 'Log in';
  static const String _signUp = 'Sign up';
  static const String _username = 'User Name';
  static const String _email = 'Email';
  static const String _phone = 'Mobile Number';
  static const String _password = 'Password';
  static const String _confirmPassword = 'Confirm Password';
  static const String _haveAccount = 'Already have an account?';
}

class SingUpScreenPaddings {
  static const EdgeInsets _verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets _horizontalPadding =
      EdgeInsets.symmetric(horizontal: 12);
}

class RegExes {
  static const String _username = '^[a-zA-Z0-9_]{3,20}\$';

  static const String _email =
      '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$';

  static const String _phone =
      '^(\\(\\d{3}\\)|\\d{3})[-\\s.]?\\d{3}[-\\s.]?\\d{4}\$';

  static const String _password =
      '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$';

  static bool validateUsername(String username) =>
      RegExp(_username).hasMatch(username);

  static bool validateEmail(String email) => RegExp(_email).hasMatch(email);

  static bool validatePhone(String phone) => RegExp(_phone).hasMatch(phone);

  static bool validatePassword(String password) =>
      RegExp(_password).hasMatch(password);
}

class ValidationRules {
  String? emailValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validateEmail(value)) {
      return 'Email';
    }
    return null;
  }

  String? userNameValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validateUsername(value)) {
      return 'username';
    }
    return null;
  }

  String? phoneValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validatePhone(value)) {
      return 'phone';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (RegExes.validatePassword(value)) {
      return 'password';
    }
    return null;
  }
}
