import 'package:flutter/material.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/topic/model/topic.dart';

class NotesView extends StatefulWidget {
  const NotesView({@required this.topic});

  final Topic topic;

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  List<Note> notes;

  List<Note> fetchNotes() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    notes = fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Text('Notes come here'),
        ],
      ),
    );
  }
}
