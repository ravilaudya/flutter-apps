import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/actions/notes_store.dart';
import 'package:petal_book/note/model/media_model.dart';
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
  File _pickedImage;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _notesController.dispose();
  }

  Future<void> saveNote() async {
    final UserDetails user = Provider.of<UserDetails>(context);
    final Topic activeTopic = Provider.of<Topic>(context);
    final List<MediaModel> media = <MediaModel>[];
    if (_pickedImage != null) {
      media.add(MediaModel(location: _pickedImage.path, type: 'File'),);
    }
    final Note newNote = Note(
      title: _titleController.text,
      contents: _notesController.text,
      media: media,
    );
    final Note addedNote = await addNote(user, activeTopic, newNote);
    if (addedNote != null) {
      Navigator.pop(context);
    }
  }

  Future<void> pickImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _newNoteFormKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _notesController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                child: _pickedImage == null
                    ? const Text('')
                    : Image.file(_pickedImage),
              ),
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () async {
                await pickImage();
              },
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
      ),
    );
  }
}
