import 'package:flutter/material.dart';
import 'package:star_pharm/shared/shared_padding.dart';
import 'package:star_pharm/widgets/png_image.dart';

import '../routes/route.dart';
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: SharedPadding().horizontalPadding,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PngImage(
                        url: SignInScreen._url, width: SignInScreen._imgWidth),
                    _space(),
                    Text(
                      SharedStrings.logIn,
                      style: Theme.of(context).primaryTextTheme.headlineLarge,
                    ),
                    _space(),
                    TextFormField(
                      decoration: InputDecoration(
                        border: Theme.of(context).inputDecorationTheme.border,
                        focusedBorder:
                            Theme.of(context).inputDecorationTheme.border,
                        hintText: SharedHints.email,
                        labelText: SharedStrings.email,
                      ),
                    ),
                    _space(),
                    TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            labelText: SharedStrings.password,
                            border:
                                Theme.of(context).inputDecorationTheme.border,
                            focusedBorder:
                                Theme.of(context).inputDecorationTheme.border,
                            suffixIcon: IconButton(
                              icon: Icon(visibilityData()),
                              onPressed: update,
                            ))),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RoutePath.forgotPassword);
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
                        onPressed: () {
                          Navigator.of(context).pushNamed(RoutePath.home);
                        },
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
                            Navigator.of(context).pushNamed(RoutePath.signUp);
                          },
                          child: Text(
                            SharedStrings.signUp,
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
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
