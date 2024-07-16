import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  const DateInput({super.key});

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
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

  @override
  Widget build(BuildContext context) {
    return Center(
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
    ));
  }
}
