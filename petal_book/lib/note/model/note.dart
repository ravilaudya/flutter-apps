import 'package:flutter/foundation.dart';

class Note {
  Note({@required this.title, this.uid, this.contents});

  String uid;
  String title;
  String contents;
}
