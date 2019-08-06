import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/view/note_page_form.dart';
import 'package:petal_book/topic/model/topic.dart';
import 'package:provider/provider.dart';

class NoteAddPage extends StatefulWidget {
  @override
  _NoteAddPageState createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<UserDetails>.value(value: Provider.of<UserDetails>(context)),
        Provider<Topic>.value(value: Provider.of<Topic>(context)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Note!'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: NotePageForm(),
        ),
      ),
    );
  }
}
