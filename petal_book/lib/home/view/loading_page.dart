import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petal_book/core/user/actions/auth.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/home/actions/new_user_setup.dart';
import 'package:petal_book/home/view/home_page.dart';
import 'package:petal_book/topic/model/topic.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  UserDetails _user;
  Topic _activeTopic;

  Future<void> fetchUser() async {
    _user = await getLoggedInUser();
    _user ??= await setUpNewAnonymousUser();
    _activeTopic = await setupBasicTopic(_user);
    print('FetchUser, User: $_user');
    if (_user != null) {
      Navigator.push(
        context,
        MaterialPageRoute<HomePage>(
          builder: (BuildContext context) =>
              HomePage(user: _user, activeTopic: _activeTopic),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    print('Fetching user in loading...');
    fetchUser();
    print('after fetch user in loading....');
  }

  Widget spinner() {
    return SpinKitFadingCircle(
      itemBuilder: (_, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return spinner();
  }
}
