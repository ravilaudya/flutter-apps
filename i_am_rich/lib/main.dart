import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'I am Rich',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Iam Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child:
            Image(image: AssetImage('images/diamond.png')),
        ),
      ),
    ),
  );
}
