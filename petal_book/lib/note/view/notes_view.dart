import 'package:flutter/material.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/note/view/note_add_view.dart';
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

  ListView showNotes() {
    return ListView(
      children: const <Widget>[
        Text('Hello'),
        Text('I am here'),
        Text('Ding dong'),
      ],
    );
  }

  Widget showNotesOrAddNote() {
    if (notes == null || notes.isEmpty) {
      return Container(
        child: Column(
          children: <Widget>[
            const Text(
              'Let\'s get started with adding few notes...',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<NoteAddView>(
                        builder: (BuildContext context) => NoteAddView()));
              },
              child: const Text('+'),
            ),
          ],
        ),
      );
    }
    return showNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          showNotesOrAddNote(),
        ],
      ),
    );
  }
}
