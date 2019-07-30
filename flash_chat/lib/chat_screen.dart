import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/welcome_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String routeKey = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController msgTextController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _store = Firestore.instance;
  FirebaseUser _loggedInUser;
  String _messageText;

  void fetchLoggedInUser() async {
    try {
      _loggedInUser = await _auth.currentUser();
      if (_loggedInUser == null) {
        Navigator.pop(context);
      }
      print(_loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: Text('Chat'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              await _auth.signOut();
              Navigator.popAndPushNamed(context, WelcomeScreen.routeKey);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _store.collection('messages').snapshots(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  List<DocumentSnapshot> documents =
                      asyncSnapshot.data.documents;
                  List<Text> messageWidgets = [];
                  for (DocumentSnapshot doc in documents) {
                    String text = doc.data['text'];
                    String sender = doc.data['sender'];
                    Text widget = Text(text + " from " + sender);
                    messageWidgets.add(widget);
                  }
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      children: messageWidgets,
                    ),
                  );
                }
                return Container();
              },
            ),
            Container(
              child: TextField(
                controller: msgTextController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _messageText = value;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter message',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {
                msgTextController.clear();
                _store.collection('messages').document().setData(
                    {'sender': _loggedInUser.email, 'text': _messageText});
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
