import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

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
  String birthDate = '11 Yanvar 2024';
  String gender = 'Kişi';
  String phone = '018868**37';
  String email = 'singh@gmail.com';
  String location = 'India';

  List<bool> isSelectedGender = [true, false, false];
  List<bool> isSelectedUserRole = [true, false, false];
  static const double _radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context).primaryTextTheme.headlineLarge,
                  ),
                ),
                _space(),
                TextFormField(
                  validator: ValidationRules().userNameValidation,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      )),
                      hintText: SharedHints.username,
                      labelText: SharedStrings.username,
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                  initialValue: username,
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationRules().emailValidation,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      )),
                      hintText: SharedHints.email,
                      labelText: SharedStrings.email,
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      )),
                      hintText: SharedHints.birthdate,
                      labelText: SharedStrings.birthdate,
                      border: const OutlineInputBorder(),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                  inputFormatters: [SharedMaskes().birthdayMask],
                ),
                _space(),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [SharedMaskes().phoneMask],
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      )),
                      hintText: SharedHints.phone,
                      labelText: SharedStrings.phone,
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
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
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                          child: Text(SharedStrings.male,
                              style: TextStyle(fontSize: 18))),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                        child: Text(SharedStrings.female,
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                          child: Text(SharedStrings.other,
                              style: TextStyle(fontSize: 18))),
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
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                          child: Text(SharedStrings.patient,
                              style: TextStyle(fontSize: 18))),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                        child: Text(SharedStrings.doctor,
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 3 - 12,
                      child: const Center(
                          child: Text(SharedStrings.pharmacist,
                              style: TextStyle(fontSize: 18))),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    _selectedRole(newIndex);
                  },
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
