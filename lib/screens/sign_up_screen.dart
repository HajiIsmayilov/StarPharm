import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:star_pharm/cache/user_cache.dart';
import 'package:star_pharm/models/user.dart';

import '../routes/route.dart';
import '../shared/shared_maskes.dart';
import '../shared/shared_padding.dart';
import '../shared/shared_strings.dart';
import '../validations/regexes.dart';
import '../widgets/png_image.dart';
import "../widgets/custom_rectangle_border_button.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const _url = 'assets/images/logo.png';
  static const double _imgWidth = 300;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _phoneController = TextEditingController();

  static bool _obscureText = true;
  static const double _radius = 8.0;

  int _selectedGender = 0;
  List<bool> isSelectedGender = [true, false, false];

  int _selectedUserRole = 0;
  List<bool> isSelectedUserRole = [true, false, false];

  String _selectedCountry = '';

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _usernameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _birthdateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: SharedPadding().horizontalPadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _space(),
                  const PngImage(
                      url: SignUpScreen._url, width: SignUpScreen._imgWidth),
                  const Text(
                    SharedStrings.signUp,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _firstnameController,
                    hint: SharedHints.firstname,
                    label: SharedStrings.firstname,
                    inputType: TextInputType.name,
                    validation: ValidationRules().userNameValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _lastnameController,
                    hint: SharedHints.lastname,
                    label: SharedStrings.lastname,
                    inputType: TextInputType.name,
                    validation: ValidationRules().userNameValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _usernameController,
                    hint: SharedHints.username,
                    label: SharedStrings.username,
                    inputType: TextInputType.name,
                    validation: ValidationRules().userNameValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _emailController,
                    hint: SharedHints.email,
                    label: SharedStrings.email,
                    inputType: TextInputType.emailAddress,
                    validation: ValidationRules().emailValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _birthdateController,
                    hint: SharedHints.birthdate,
                    label: SharedStrings.birthdate,
                    inputType: TextInputType.datetime,
                    formatter: SharedMaskes().birthdayMask,
                  ),
                  _space(),
                  _CustomTextFormField(
                    controller: _phoneController,
                    hint: SharedHints.phone,
                    label: SharedStrings.phone,
                    inputType: TextInputType.phone,
                    formatter: SharedMaskes().phoneMask,
                  ),
                  _space(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(_radius)),
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CountryCodePicker(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          searchDecoration: InputDecoration(
                              border:
                                  Theme.of(context).inputDecorationTheme.border,
                              focusedBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .border),
                          initialSelection: 'AZ',
                          showOnlyCountryWhenClosed: true,
                          showCountryOnly: true,
                          flagWidth: 48,
                          onChanged: (value) {
                            _selectedCountry = value.code.toString();
                          },
                        ),
                      ],
                    ),
                  ),
                  _space(),
                  _CustomToggleButton3Options(
                    firstOption: SharedStrings.male,
                    secondOption: SharedStrings.female,
                    thirdOption: SharedStrings.other,
                    isSelected: isSelectedGender,
                    func: (value) {
                      _selectedGender = _selectGender(value);
                    },
                  ),
                  _space(),
                  _CustomToggleButton3Options(
                    firstOption: SharedStrings.patient,
                    secondOption: SharedStrings.doctor,
                    thirdOption: SharedStrings.pharmacist,
                    func: (value) {
                      _selectedUserRole = _selectRole(value);
                    },
                    isSelected: isSelectedUserRole,
                  ),
                  _space(),
                  TextFormField(
                      obscureText: _obscureText,
                      validator: ValidationRules().passwordValidation,
                      decoration: InputDecoration(
                          labelText: SharedStrings.password,
                          border: Theme.of(context).inputDecorationTheme.border,
                          focusedBorder:
                              Theme.of(context).inputDecorationTheme.border,
                          suffixIcon: IconButton(
                            icon: Icon(visibilityData()),
                            onPressed: update,
                          ))),
                  _space(),
                  TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: SharedStrings.confirmPassword,
                          border: Theme.of(context).inputDecorationTheme.border,
                          focusedBorder:
                              Theme.of(context).inputDecorationTheme.border,
                          suffixIcon: IconButton(
                            icon: Icon(visibilityData()),
                            onPressed: update,
                          ))),
                  _space(),
                  SizedBox(
                    width: double.infinity,
                    child: CustomRectangleBorderButton(
                      title: SharedStrings.signUp,
                      onPressed: () async {
                        String fullname = _firstnameController.text +
                            ' ' +
                            _lastnameController.text;

                        var user = User(
                            fullName: fullname,
                            username: _usernameController.text,
                            email: _emailController.text,
                            birthdate: _birthdateController.text,
                            phone: _phoneController.text,
                            gender: _getSeletedGender(_selectedGender),
                            role: _getSeletedRole(_selectedUserRole),
                            location: 'Az');
                        _validate(context);

                        UserCache.setUser(user);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        SharedStrings.haveAccount,
                        style: Theme.of(context).primaryTextTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RoutePath.signIn);
                        },
                        child: Text(
                          SharedStrings.logIn,
                          style: Theme.of(context).primaryTextTheme.titleSmall,
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
    );
  }

  String _getSeletedRole(int index) {
    String role;
    switch (index) {
      case 0:
        role = SharedStrings.patient;
        break;
      case 1:
        role = SharedStrings.doctor;
        break;
      case 2:
        role = SharedStrings.pharmacist;
        break;
      default:
        throw Exception('Unidentified role');
    }
    return role;
  }

  String _getSeletedGender(int index) {
    String gender;
    switch (index) {
      case 0:
        gender = SharedStrings.male;
        break;
      case 1:
        gender = SharedStrings.female;
        break;
      case 2:
        gender = SharedStrings.other;
        break;
      default:
        throw Exception('Unidentified gender');
    }
    return gender;
  }

  int _selectRole(int newIndex) {
    int selectedIndex = 0;
    setState(() {
      for (int index = 0; index < isSelectedUserRole.length; index++) {
        if (index == newIndex) {
          isSelectedUserRole[index] = true;
          selectedIndex = index;
        } else {
          isSelectedUserRole[index] = false;
        }
      }
    });
    return selectedIndex;
  }

  int _selectGender(int newIndex) {
    int selectedIndex = 0;
    setState(() {
      for (int index = 0; index < isSelectedGender.length; index++) {
        if (index == newIndex) {
          isSelectedGender[index] = true;
          selectedIndex = index;
        } else {
          isSelectedGender[index] = false;
        }
      }
    });
    return selectedIndex;
  }

  String? _validate(context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
    return null;
  }

  SizedBox _space() => const SizedBox(height: 12);

  IconData visibilityData() {
    return _obscureText ? Icons.visibility_off : Icons.visibility;
  }

  void update() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

// ignore: must_be_immutable
class _CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validation;
  MaskTextInputFormatter? formatter;
  final String hint;
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  _CustomTextFormField(
      {required this.hint,
      required this.label,
      required this.inputType,
      this.validation,
      this.formatter,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.border,
        hintText: hint,
        labelText: label,
      ),
      inputFormatters: formatter != null ? [formatter!] : null,
      keyboardType: inputType,
    );
  }
}

class _CustomToggleButton3Options extends StatelessWidget {
  final List<bool> isSelected;
  final String firstOption;
  final String secondOption;
  final String thirdOption;
  final Function(int value) func;

  const _CustomToggleButton3Options({
    required this.isSelected,
    required this.firstOption,
    required this.secondOption,
    required this.thirdOption,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Theme.of(context).primaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      renderBorder: true,
      borderColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      onPressed: func,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 3 - 12,
          child: Center(
              child: Text(
            firstOption,
            style: TextStyle(
              fontSize:
                  Theme.of(context).primaryTextTheme.titleMedium?.fontSize,
            ),
          )),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 3 - 12,
          child: Center(
            child: Text(
              secondOption,
              style: TextStyle(
                fontSize:
                    Theme.of(context).primaryTextTheme.titleMedium?.fontSize,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 3 - 12,
          child: Center(
              child: Text(
            thirdOption,
            style: TextStyle(
              fontSize:
                  Theme.of(context).primaryTextTheme.titleMedium?.fontSize,
            ),
          )),
        ),
      ],
    );
  }
}
