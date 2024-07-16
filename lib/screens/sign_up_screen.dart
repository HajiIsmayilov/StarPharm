import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  late String? dropdownValue = 'Male';

  // one must always be true, means selected.
  List<bool> isSelectedGender = [true, false, false];
  List<bool> isSelectedUserRole = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SignUpScreenPaddings._horizontalPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const JpgImage(
                    url: SignUpScreen._url, width: SignUpScreen._imgWidth),
                const Text(
                  SignUpScreenStrings._signUp,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _space(),
                TextFormField(
                  validator: ValidationRules().userNameValidation,
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints._username,
                    labelText: SignUpScreenStrings._username,
                    border: OutlineInputBorder(),
                  ),
                ),
                _space(),
                TextFormField(
                  validator: ValidationRules().emailValidation,
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints._email,
                    labelText: SignUpScreenStrings._email,
                    border: OutlineInputBorder(),
                  ),
                ),
                _space(),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints._birthdate,
                    labelText: SignUpScreenStrings._birthday,
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [SignUpScreenMaskes().birthdayMask],
                ),
                _space(),
                TextFormField(
                  inputFormatters: [SignUpScreenMaskes().phoneMask],
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints._phone,
                    labelText: SignUpScreenStrings._phone,
                    border: OutlineInputBorder(),
                  ),
                ),
                _space(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(_radius)),
                  ),
                  width: double.infinity,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CountryCodePicker(
                        textStyle: TextStyle(fontSize: 18, color: Colors.black),
                        initialSelection: 'AZ',
                        showOnlyCountryWhenClosed: true,
                        showCountryOnly: true,
                        flagWidth: 48,
                      ),
                    ],
                  ),
                ),
                _space(),
                ToggleButtons(
                  isSelected: isSelectedGender,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  fillColor: Colors.teal,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  renderBorder: true,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child:
                                Text('MALE', style: TextStyle(fontSize: 18))),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text('FEMALE', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child:
                                Text('OTHER', style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  ],
                  // to select or deselect when pressed
                  onPressed: (int newIndex) {
                    setState(() {
                      // looping through the list of booleans values
                      for (int index = 0;
                          index < isSelectedGender.length;
                          index++) {
                        // checking for the index value
                        if (index == newIndex) {
                          // one button is always set to true
                          isSelectedGender[index] = true;
                        } else {
                          // other two will be set to false and not selected
                          isSelectedGender[index] = false;
                        }
                      }
                    });
                  },
                ),
                _space(),
                ToggleButtons(
                  isSelected: isSelectedUserRole,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  fillColor: Colors.teal,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  renderBorder: true,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text('PATIENT',
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text('DOCTOR', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text('PHARMACIST',
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  ],
                  // to select or deselect when pressed
                  onPressed: (int newIndex) {
                    setState(() {
                      // looping through the list of booleans values
                      for (int index = 0;
                          index < isSelectedUserRole.length;
                          index++) {
                        // checking for the index value
                        if (index == newIndex) {
                          // one button is always set to true
                          isSelectedUserRole[index] = true;
                        } else {
                          // other two will be set to false and not selected
                          isSelectedUserRole[index] = false;
                        }
                      }
                    });
                  },
                ),
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SignUpScreenStrings._password,
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
                        labelText: SignUpScreenStrings._confirmPassword,
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
                    title: SignUpScreenStrings._signUp,
                    onPressed: () {
                      _validate(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      SignUpScreenStrings._haveAccount,
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        SignUpScreenStrings._logIn,
                        style: TextStyle(color: Colors.teal, fontSize: 16),
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
}

class SignUpScreenStrings {
  static const String _logIn = 'Log in';
  static const String _signUp = 'Sign up';
  static const String _username = 'User Name';
  static const String _birthday = 'Birthdate';
  static const String _email = 'Email';
  static const String _phone = 'Mobile Number';
  static const String _password = 'Password';
  static const String _confirmPassword = 'Confirm Password';
  static const String _haveAccount = 'Already have an account?';
}

class SignUpScreenMaskes {
  final phoneMask = MaskTextInputFormatter(
      mask: '(###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final birthdayMask = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}

class SignUpScreenHints {
  static const String _username = 'Kerim Kerimli';
  static const String _email = 'kerimkrm@gmail.com';
  static const String _birthdate = '07/07/2007';
  static const String _phone = '(090) 111-11-11';
}

class SignUpScreenPaddings {
  //static const EdgeInsets _verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets _horizontalPadding =
      EdgeInsets.symmetric(horizontal: 12);
}
