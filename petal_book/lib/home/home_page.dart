import 'package:flutter/material.dart';
import 'package:petal_book/core/user/actions/auth.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/core/user/model/user_profile.dart';
import 'package:petal_book/note/view/notes_view.dart';
import 'package:petal_book/topic/model/topic.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({this.topics, this.profile, this.activeTopic});

  final List<Topic> topics;
  final UserProfile profile;
  final Topic activeTopic;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  UserDetails _user;

  Future<void> fetchUser() async {
    _user = await getLoggedInUser();
    _user ??= await signInAnonymously();
    print('User: $_user');
  }

  @override
  void initState() {
    super.initState();
    print('Fetching user....');
    fetchUser();
    print('after fetch user....');
  }

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
      body: NotesView(topic: widget.activeTopic),
    );
  }
}
