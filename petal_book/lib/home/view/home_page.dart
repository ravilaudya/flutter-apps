import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/view/notes_page.dart';
import 'package:petal_book/topic/model/topic.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.topics, this.user, this.activeTopic});

  final List<Topic> topics;
  final UserDetails user;
  final Topic activeTopic;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petal Book'),
        actions: const <Widget>[
          Text('No Name'),
        ],
        leading: const Text('General'),
      ),
      body: NotesPage(topic: widget.activeTopic),
    );
  }
}
