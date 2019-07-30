import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/chat_screen.dart';
import "package:flutter/material.dart";
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeKey = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  bool _showSpinner = false;

  Future<FirebaseUser> registerUser(
      {@required String email, @required String password}) async {
    try {
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("New User: $user");
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
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
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
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _email = value;
                },
                keyboardType: TextInputType.emailAddress,
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
                textAlign: TextAlign.center,
                obscureText: true,
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
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Register'),
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  final FirebaseUser user =
                      await registerUser(email: _email, password: _password);
                  moveToChatScreen(user);
                  setState(() {
                    _showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
