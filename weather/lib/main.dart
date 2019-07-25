import 'package:flutter/material.dart';
import 'package:weather/loading_page.dart';

void main() { 
  runApp(WeatherApp());
}


class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoadingPage(),
      )
    );
  }
}