import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/chat_screen.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  static const String routeKey = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;
  String _password;

  Future<FirebaseUser> performLogin(
      {@required String email, @required String password}) async {
    try {
      final FirebaseUser user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void moveToChatScreen(FirebaseUser user) {
    if (user != null) {
      Navigator.pushNamed(context, ChatScreen.routeKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/chat-logo.jpg'),
                height: 200.0,
              ),
            ),
            TextField(
              onChanged: (value) {
                _email = value;
              },
              style: TextStyle(
                color: Colors.blue,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Your email',
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
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                _password = value;
              },
              style: TextStyle(
                color: Colors.blue,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
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
            RaisedButton(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Login'),
              onPressed: () async {
                FirebaseUser user =
                    await performLogin(email: _email, password: _password);
                moveToChatScreen(user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
