import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
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

  List<bool> isSelectedGender = [true, false, false];
  List<bool> isSelectedUserRole = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SignUpScreenPaddings().horizontalPadding,
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
                  SignUpScreenStrings.signUp,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _space(),
                TextFormField(
                  validator: ValidationRules().userNameValidation,
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints.username,
                    labelText: SignUpScreenStrings.username,
                    border: OutlineInputBorder(),
                  ),
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationRules().emailValidation,
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints.email,
                    labelText: SignUpScreenStrings.email,
                    border: OutlineInputBorder(),
                  ),
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints.birthdate,
                    labelText: SignUpScreenStrings.birthdate,
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [SignUpScreenMaskes().birthdayMask],
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [SignUpScreenMaskes().phoneMask],
                  decoration: const InputDecoration(
                    hintText: SignUpScreenHints.phone,
                    labelText: SignUpScreenStrings.phone,
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
                  fillColor: Theme.of(context).primaryColor,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  renderBorder: true,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text(SignUpScreenStrings.male,
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text(SignUpScreenStrings.female,
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text(SignUpScreenStrings.other,
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    _selectGender(newIndex);
                  },
                ),
                _space(),
                ToggleButtons(
                  isSelected: isSelectedUserRole,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  fillColor: Theme.of(context).primaryColor,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  renderBorder: true,
                  borderColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text(SignUpScreenStrings.patient,
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text(SignUpScreenStrings.doctor,
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 120,
                        child: Center(
                            child: Text(SignUpScreenStrings.pharmacist,
                                style: TextStyle(fontSize: 18))),
                      ),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    _selectedRole(newIndex);
                  },
                ),
                _space(),
                TextFormField(
                    obscureText: _obscureText,
                    validator: ValidationRules().passwordValidation,
                    decoration: InputDecoration(
                        labelText: SignUpScreenStrings.password,
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
                        labelText: SignUpScreenStrings.confirmPassword,
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
                    title: SignUpScreenStrings.signUp,
                    onPressed: () {
                      _validate(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      SignUpScreenStrings.haveAccount,
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        SignUpScreenStrings.logIn,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16),
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

  void _selectedRole(int newIndex) {
    setState(() {
      for (int index = 0; index < isSelectedUserRole.length; index++) {
        if (index == newIndex) {
          isSelectedUserRole[index] = true;
        } else {
          isSelectedUserRole[index] = false;
        }
      }
    });
  }

  void _selectGender(int newIndex) {
    setState(() {
      for (int index = 0; index < isSelectedGender.length; index++) {
        if (index == newIndex) {
          isSelectedGender[index] = true;
        } else {
          isSelectedGender[index] = false;
        }
      }
    });
  }

  // String? _validateRule(value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter some text';
  //   }
  //   return null;
  // }

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
}

class SignUpScreenStrings {
  static const String logIn = 'Log in';
  static const String signUp = 'Sign up';
  static const String username = 'User Name';
  static const String birthdate = 'Birthdate';
  static const String email = 'Email';
  static const String phone = 'Mobile Number';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String haveAccount = 'Already have an account?';
  static const String male = 'MALE';
  static const String female = 'FEMALE';
  static const String other = 'OTHER';
  static const String patient = 'PATIENT';
  static const String doctor = 'DOCTOR';
  static const String pharmacist = 'FARMACIST';
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
  static const String username = 'Kerim Kerimli';
  static const String email = 'kerimkrm@gmail.com';
  static const String birthdate = '07/07/2007';
  static const String phone = '(090) 111-11-11';
}

class SignUpScreenPaddings {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 12);
}
