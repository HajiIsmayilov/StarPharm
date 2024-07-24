import 'package:flutter/material.dart';
import 'package:star_pharm/screens/forgot_password_screen.dart';
import 'package:star_pharm/screens/sign_up_screen.dart';
import 'package:star_pharm/shared/shared_padding.dart';
import 'package:star_pharm/widgets/jpg_image.dart';

import '../shared/shared_strings.dart';
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
          padding: SharedPadding().horizontalPadding,
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
                    SharedStrings.logIn,
                    style: Theme.of(context).primaryTextTheme.headlineLarge,
                  ),
                  _space(),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: SharedStrings.email,
                    ),
                  ),
                  _space(),
                  TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: SharedStrings.password,
                          suffixIcon: IconButton(
                            icon: Icon(visibilityData()),
                            onPressed: update,
                          ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: const Text(
                        SharedStrings.forgotPassword,
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomRectangleBorderButton(
                      title: SharedStrings.logIn,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        SharedStrings.dontHaveAccount,
                        style: Theme.of(context).primaryTextTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: Text(
                          SharedStrings.signUp,
                          style: Theme.of(context).primaryTextTheme.titleSmall,
                        ),
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
