import 'package:flutter/material.dart';
import 'package:star_pharm/shared/shared_strings.dart';

import '../validations/regexes.dart';
import '../widgets/custom_rectangle_border_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  static bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SharedStrings.changePassword,
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SharedStrings.currentPassword,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(visibilityData()),
                          onPressed: update,
                        ))),
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SharedStrings.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(visibilityData()),
                          onPressed: update,
                        ))),
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SharedStrings.confirmPassword,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(visibilityData()),
                          onPressed: update,
                        ))),
                _space(),
                SizedBox(
                  width: double.infinity,
                  child: CustomRectangleBorderButton(
                    title: SharedStrings.save,
                    onPressed: () {},
                  ),
                ),
              ],
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
