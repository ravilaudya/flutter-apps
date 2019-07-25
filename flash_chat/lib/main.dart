import 'package:flash_chat/chat_screen.dart';
import 'package:flash_chat/login_screen.dart';
import 'package:flash_chat/registration_screen.dart';
import 'package:flash_chat/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChatApp());

class FlashChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.routeKey,
      routes: {
        WelcomeScreen.routeKey: (context) => WelcomeScreen(),
        LoginScreen.routeKey: (context) => LoginScreen(),
        RegistrationScreen.routeKey: (context) => RegistrationScreen(),
        ChatScreen.routeKey: (context) => ChatScreen(),
      },
    );
  }
}
