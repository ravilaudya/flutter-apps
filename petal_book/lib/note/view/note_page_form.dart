import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/actions/notes_store.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/topic/model/topic.dart';
import 'package:provider/provider.dart';

class NotePageForm extends StatefulWidget {
  @override
  _NotePageFormState createState() => _NotePageFormState();
}

class _NotePageFormState extends State<NotePageForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey _newNoteFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _notesController.dispose();
  }

  Future<void> saveNote() async {
    final UserDetails user = Provider.of<UserDetails>(context);
    final Topic activeTopic = Provider.of<Topic>(context);
    final Note newNote =
        Note(title: _titleController.text, contents: _notesController.text);
    final Note addedNote = await addNote(user, activeTopic, newNote);
    if (addedNote != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _newNoteFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _titleController,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Title is mandatory';
              }
              return null;
            },
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _notesController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(labelText: 'Notes'),
          ),
          RaisedButton(
            onPressed: () async {
              final FormState state = _newNoteFormKey.currentState;
              if (state.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: const Text('Saving...')));
                await saveNote();
                _titleController.clear();
                _notesController.clear();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
