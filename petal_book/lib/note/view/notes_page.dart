import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/note/view/note_add_page.dart';
import 'package:petal_book/topic/model/topic.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({@required this.topic});

  final Topic topic;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
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

  Widget showNotesOrAddNote(BuildContext parentContext) {
    final UserDetails user = Provider.of<UserDetails>(parentContext);
    final String userId = user.uid;

    if (notes == null || notes.isEmpty) {
      return Container(
        child: Column(
          children: <Widget>[
            Text('Hello, $userId'),
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
                    parentContext,
                    MaterialPageRoute<NoteAddPage>(
                        builder: (BuildContext context) =>
                            MultiProvider(providers: <Provider<dynamic>>[
                              Provider<UserDetails>.value(
                                  value: Provider.of<UserDetails>(parentContext)),
                              Provider<Topic>.value(
                                  value: Provider.of<Topic>(parentContext)),
                            ], child: NoteAddPage())));
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
    return MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<UserDetails>.value(value: Provider.of<UserDetails>(context)),
        Provider<Topic>.value(value: Provider.of<Topic>(context)),
      ],
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            showNotesOrAddNote(context),
          ],
        ),
      ),
    );
  }
}
