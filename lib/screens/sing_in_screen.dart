import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/jpg_image.dart';

import '../widgets/custom_rectangle_border_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  static bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: SingInScreenPaddings().horizontalPadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const JpgImage(
                      url: SignInScreen._url, width: SignInScreen._imgWidth),
                  _space(),
                  Text(
                    SingInScreenStrings.logIn,
                    style: Theme.of(context).primaryTextTheme.headlineLarge,
                  ),
                  _space(),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: SingInScreenStrings.email,
                    ),
                  ),
                  _space(),
                  TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: SingInScreenStrings.password,
                          suffixIcon: IconButton(
                            icon: Icon(visibilityData()),
                            onPressed: update,
                          ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        SingInScreenStrings.forgotPassword,
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomRectangleBorderButton(
                      title: SingInScreenStrings.logIn,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(SingInScreenStrings.dontHaveAccount),
                      TextButton(
                        onPressed: () {},
                        child: const Text(SingInScreenStrings.signUp),
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
  static const String logIn = 'Log in';
  static const String signUp = 'Sign up';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = 'Don\'t have an account?';
}

class SingInScreenPaddings {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 12);
}
