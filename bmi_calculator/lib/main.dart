import 'package:bmi_calculator/bmi_page.dart';
import 'package:flutter/material.dart';
import "./input_page.dart";

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/bmi': (context) => BMIPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
