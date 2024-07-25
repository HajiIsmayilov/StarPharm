import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData theme = ThemeData.light().copyWith(
      primaryColor: Colors.teal,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: Colors.teal,
          labelStyle: const TextStyle(color: Colors.teal)),
      primaryTextTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        labelLarge: TextStyle(fontSize: 20),
        labelMedium: TextStyle(fontSize: 16, color: Colors.black),
        labelSmall: TextStyle(fontSize: 12, color: Colors.black),
        titleMedium: TextStyle(fontSize: 18),
        titleSmall: TextStyle(fontSize: 12, color: Colors.teal),
      ));
}