import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../shared/shared_padding.dart';
import '../shared/shared_maskes.dart';
import '../shared/shared_strings.dart';
import '../validations/regexes.dart';
import '../widgets/custom_rectangle_border_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = 'Malikoğlu Anar';
  String username = '@mrAnar';
  String birthDate = '07/07/2007';
  String gender = 'Kişi';
  String phone = '(099) 111-11-11';
  String email = 'singh@gmail.com';
  String location = 'India';

  List<bool> isSelectedGender = [true, false, false];
  List<bool> isSelectedUserRole = [true, false, false];
  static const double _radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SharedStrings.editProfile,
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: SharedPadding().horizontalPadding,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _space(),
                  _CustomTextFormField(
                    initialValue: username,
                    hint: SharedHints.username,
                    label: SharedStrings.username,
                    inputType: TextInputType.name,
                    validation: ValidationRules().userNameValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    initialValue: email,
                    hint: SharedHints.email,
                    label: SharedStrings.email,
                    inputType: TextInputType.emailAddress,
                    validation: ValidationRules().emailValidation,
                  ),
                  _space(),
                  _CustomTextFormField(
                    hint: SharedHints.birthdate,
                    label: SharedStrings.birthdate,
                    initialValue: birthDate,
                    inputType: TextInputType.datetime,
                    formatter: SharedMaskes().birthdayMask,
                  ),
                  _space(),
                  _CustomTextFormField(
                    hint: SharedHints.phone,
                    label: SharedStrings.phone,
                    initialValue: phone,
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CountryCodePicker(
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
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
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 16);

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
}

// ignore: must_be_immutable
class _CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validation;
  MaskTextInputFormatter? formatter;
  final String hint;
  final String label;
  final TextInputType inputType;
  final String initialValue;

  _CustomTextFormField(
      {required this.hint,
      required this.label,
      required this.initialValue,
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
      initialValue: initialValue,
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
