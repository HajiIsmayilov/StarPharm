import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

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
  static bool _obscureText = true;
  static const double _radius = 8.0;
  late String? dropdownValue = 'Male';

  List<bool> isSelectedGender = [true, false, false];
  List<bool> isSelectedUserRole = [true, false, false];

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
                  // TextFormField(
                  //   validator: ValidationRules().userNameValidation,
                  //   decoration: const InputDecoration(
                  //     hintText: SharedHints.username,
                  //     labelText: SharedStrings.username,
                  //   ),
                  // ),
                  _CustomTextFormField(
                    hint: SharedHints.username,
                    label: SharedStrings.username,
                    inputType: TextInputType.name,
                    validation: ValidationRules().userNameValidation,
                  ),
                  _space(),
                  // TextFormField(
                  //   keyboardType: TextInputType.emailAddress,
                  //   validator: ValidationRules().emailValidation,
                  //   decoration: const InputDecoration(
                  //     hintText: SharedHints.email,
                  //     labelText: SharedStrings.email,
                  //   ),
                  // ),
                  _CustomTextFormField(
                    hint: SharedHints.email,
                    label: SharedStrings.email,
                    inputType: TextInputType.emailAddress,
                    validation: ValidationRules().emailValidation,
                  ),
                  _space(),
                  // TextFormField(
                  //   keyboardType: TextInputType.datetime,
                  //   decoration: const InputDecoration(
                  //     hintText: SharedHints.birthdate,
                  //     labelText: SharedStrings.birthdate,
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   inputFormatters: [SharedMaskes().birthdayMask],
                  // ),
                  _CustomTextFormField(
                    hint: SharedHints.birthdate,
                    label: SharedStrings.birthdate,
                    inputType: TextInputType.datetime,
                    formatter: SharedMaskes().birthdayMask,
                  ),
                  _space(),
                  // TextFormField(
                  //   keyboardType: TextInputType.phone,
                  //   inputFormatters: [SharedMaskes().phoneMask],
                  //   decoration: const InputDecoration(
                  //     hintText: SharedHints.phone,
                  //     labelText: SharedStrings.phone,
                  //   ),
                  // ),
                  _CustomTextFormField(
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
                              fontSize: 18, color: Colors.black),
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
                    func: _selectGender,
                  ),
                  _space(),
                  _CustomToggleButton3Options(
                    firstOption: SharedStrings.patient,
                    secondOption: SharedStrings.doctor,
                    thirdOption: SharedStrings.pharmacist,
                    func: _selectedRole,
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
                      onPressed: () {
                        _validate(context);
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

// ignore: must_be_immutable
class _CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validation;
  MaskTextInputFormatter? formatter;
  final String hint;
  final String label;
  final TextInputType inputType;

  _CustomTextFormField(
      {required this.hint,
      required this.label,
      required this.inputType,
      this.validation,
      this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
