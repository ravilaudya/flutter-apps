import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserDetails {
  UserDetails({@required this.uid});
  final String uid;

  @override
  String toString() {
    return '{uid: $uid}';
  }

}
