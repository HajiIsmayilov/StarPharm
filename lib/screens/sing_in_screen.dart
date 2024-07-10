import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/jpg_image.dart';

import '../widgets/custom_rectangle_border_button.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});
  static const _url = 'assets/images/health.jpg';
  static const double _cardHeight = 308;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          JpgImage(
            url: _url,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: SizedBox(
              height: _cardHeight,
              child: Card(
                child: Padding(
                  padding: SingInScreenPaddings._horizontalPadding,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          SingInScreenStrings._logIn,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _space(),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: SingInScreenStrings._email,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        _space(),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            fillColor: Colors.black,
                            labelText: SingInScreenStrings._password,
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                        ),
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
                          child:  CustomRectangleBorderButton(
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
          )
        ],
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 16);
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
