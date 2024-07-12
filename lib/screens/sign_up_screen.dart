import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_pharm/widgets/custom_rectangle_border_button.dart';

import '../validations/regexes.dart';
import '../widgets/jpg_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  static bool _obscureText = true;
  static const double _radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SingUpScreenPaddings._horizontalPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const JpgImage(
                    url: SignUpScreen._url, width: SignUpScreen._imgWidth),
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
                makeInputDate(context, label: "Birthdate"),
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
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SingUpScreenStrings._password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(_radius),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(visibilityData()),
                          onPressed: update,
                        ))),
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        labelText: SingUpScreenStrings._confirmPassword,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(_radius),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(visibilityData()),
                          onPressed: update,
                        ))),
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
    return null;
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

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget makeInputDate(context, {label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Text(DateFormat('yyyy/MM/dd').format(selectedDate)),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
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
  //static const EdgeInsets _verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets _horizontalPadding =
      EdgeInsets.symmetric(horizontal: 12);
}
