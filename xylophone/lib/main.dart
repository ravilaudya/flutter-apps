import 'package:audioplayers/audio_cache.dart';
// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: XylophoneApp(),
  ));
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xylophone'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            soundButton(audioNumber: 1, color: Colors.red),
            soundButton(audioNumber: 2, color: Colors.green),
            soundButton(audioNumber: 3, color: Colors.blue),
            soundButton(audioNumber: 4, color: Colors.orange),
            soundButton(audioNumber: 5, color: Colors.cyan),
            soundButton(audioNumber: 6, color: Colors.pink),
            soundButton(audioNumber: 7, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}

Widget soundButton({int audioNumber, Color color}) {
  return Expanded(
    child: FlatButton(
      color: color,
      child: Text(''),
      onPressed: () {
        final player = AudioCache();
        player.play('note$audioNumber.wav');
      },
    ),
  );
}
