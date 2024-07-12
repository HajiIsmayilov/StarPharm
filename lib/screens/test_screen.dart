import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_pharm/widgets/post_cart.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("${selectedDate.toLocal()}".split(' ')[0]),
  //           const SizedBox(height: 20.0,),
  //           ElevatedButton(
  //             onPressed: () => _selectDate(context),
  //             child: const Text('Select date'),
  //           ),
  //         ],
  //       ),

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PostCard(
          imageUrl:
              'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
          title: 'Allergik rinitin nədir və əlamətləri hansılardır?',
          authors: 'MBBS, BCS',
          views: 1250,
        ),
      ),
    );
  }

  Column newMethod(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
            items: <String>['Pacient', 'Doctor', 'ezaci']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {}),
        DropdownButton(
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {}),
        TextFormField(
            decoration: InputDecoration(
          labelText: "Enter Email",
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.blue, strokeAlign: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(227, 220, 228, 1),
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: TextFormField(
              style: const TextStyle(color: Colors.red),
              decoration: InputDecoration(
                labelText: 'Birthday',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              enabled: false,
              controller: TextEditingController(
                  text: DateFormat('yyyy/MM/dd').format(selectedDate)),
            ),
          )),
        ),
      ],
    );
  }
}
