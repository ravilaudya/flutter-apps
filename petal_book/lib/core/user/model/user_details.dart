import 'package:flutter/cupertino.dart';

class UserDetails {
  UserDetails({@required this.uid, this.displayName});
  final String uid;
  final String displayName;

  @override
  String toString() {
    return '{uid: $uid, displayName: $displayName}';
  }

}
