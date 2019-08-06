import 'package:flutter/foundation.dart';
import 'package:petal_book/note/model/media_model.dart';

class Note {
  Note({
    @required this.title,
    this.uid,
    this.contents,
    this.media,
  });

  String uid;
  String title;
  String contents;
  DateTime createdAt;
  DateTime updatedAt;
  List<MediaModel> media;
}
