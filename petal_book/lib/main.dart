import 'package:flutter/material.dart';
import 'package:petal_book/dashboard/dashboard_view.dart';

void main() => runApp(PetalBookApp());

class PetalBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
      ),
      home: const DashboardView(),
    );
  }
}
