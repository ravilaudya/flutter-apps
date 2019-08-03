import 'package:flutter/material.dart';
import 'package:petal_book/core/user/model/user_profile.dart';
import 'package:petal_book/note/view/notes_view.dart';
import 'package:petal_book/topic/model/topic.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({this.topics, this.profile, this.activeTopic});

  final List<Topic> topics;
  final UserProfile profile;
  final Topic activeTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petal Book'),
        actions: const <Widget>[
          Text('No Name'),
        ],
        leading: const Text('General'),
      ),
      body: NotesView(topic: activeTopic),
    );
  }
}
