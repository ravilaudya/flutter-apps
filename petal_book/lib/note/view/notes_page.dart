import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/actions/notes_store.dart';
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
  bool isAssetsEmpty(List<dynamic> assets) {
    if (assets == null || assets.isEmpty) {
      return true;
    }
    return false;
  }

  Widget buildNotePage(DocumentSnapshot doc) {
    final List<dynamic> assets = doc.data['assets'];
    return Card(
      child: ListTile(
        leading: isAssetsEmpty(assets)? const Text('') : Image.network(assets.first['location']),
        title: Text(doc.data['title']),
        subtitle: Text(doc.data['contents']),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  Widget showNotes(BuildContext parentContext) {
    final UserDetails user = Provider.of<UserDetails>(context);
    final Topic topic = Provider.of<Topic>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: fetchNotes(user, topic),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            print('Hey! I got some data...');
            final List<DocumentSnapshot> documents =
                asyncSnapshot.data.documents;
            if (documents == null || documents.isEmpty) {
              return showAddNote(parentContext);
            }
            final List<Widget> messageWidgets = [];
            for (DocumentSnapshot doc in documents) {
              final Widget noteWidget = buildNotePage(doc);
              messageWidgets.add(noteWidget);
            }
            return Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                children: messageWidgets,
              ),
            );
          }
          return showAddNote(parentContext);
        });
  }

  Widget showAddNote(BuildContext parentContext) {
    print('Showing add note...');
    final UserDetails user = Provider.of<UserDetails>(parentContext);
    final String userId = user.uid;

    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, $userId'),
            const Text(
              'Let\'s get started with adding few notes...',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Topic activeTopic = Provider.of<Topic>(context);
    final UserDetails user = Provider.of<UserDetails>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Petal Book'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            showNotes(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<NoteAddPage>(
              builder: (BuildContext _context) => MultiProvider(
                providers: <Provider<dynamic>>[
                  Provider<UserDetails>.value(value: user),
                  Provider<Topic>.value(value: activeTopic),
                ],
                child: NoteAddPage(),
              ),
            ),
          );
        },
        child: const Text('+'),
      ),
    );
  }
}
