import 'package:flutter/material.dart';
import 'package:petal_book/home/view/loading_page.dart';
import './theme/theme_constants.dart';

void main() => runApp(PetalBookApp());

class PetalBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme.copyWith(),
      home: LoadingPage(),
    );
  }
}
