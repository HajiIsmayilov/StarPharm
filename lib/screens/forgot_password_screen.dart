import 'package:flutter/material.dart';
import 'package:star_pharm/shared/shared_padding.dart';
import 'package:star_pharm/shared/shared_strings.dart';
//import 'package:star_pharm/screens/sign_up_screen.dart';

import '../shared/shared_maskes.dart';
import '../validations/regexes.dart';
import '../widgets/custom_rectangle_border_button.dart';
import '../widgets/jpg_image.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  static const String _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SharedPadding().horizontalPadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const JpgImage(url: _url, width: _imgWidth),
              const SizedBox(height: 10),
              Text(
                SharedStrings.forgotPasswordEmail,
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: ValidationRules().emailValidation,
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,
                  labelText: SharedStrings.email,
                  hintText: SharedHints.email,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomRectangleBorderButton(
                  title: SharedStrings.confirm,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Padding(
                        padding: SharedPadding().horizontalPadding,
                        child: const Column(
                          children: [CodeCard()],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeCard extends StatelessWidget {
  const CodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Card(
        child: Padding(
          padding: SharedPadding().horizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                SharedStrings.emailCode,
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,
                  labelText: SharedStrings.code,
                ),
                inputFormatters: [SharedMaskes().codeMask],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomRectangleBorderButton(
                  title: SharedStrings.logIn,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Padding(
                              padding: SharedPadding().horizontalPadding,
                              child: const Column(
                                children: [
                                  PasswordCard(),
                                ],
                              ),
                            ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordCard extends StatefulWidget {
  const PasswordCard({super.key});

  @override
  State<PasswordCard> createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  static bool _obscureText = true;
  static const double _radius = 8.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 258,
      child: Card(
        child: Padding(
          padding: SharedPadding().horizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                SharedStrings.enterPassword,
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
              const SizedBox(height: 12),
              TextFormField(
                  obscureText: _obscureText,
                  validator: ValidationRules().passwordValidation,
                  decoration: InputDecoration(
                      labelText: SharedStrings.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_radius),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(visibilityData()),
                        onPressed: update,
                      ))),
              const SizedBox(height: 10),
              TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: SharedStrings.confirmPassword,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_radius),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(visibilityData()),
                        onPressed: update,
                      ))),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomRectangleBorderButton(
                  title: SharedStrings.logIn,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData visibilityData() {
    return _obscureText ? Icons.visibility_off : Icons.visibility;
  }

  void update() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
