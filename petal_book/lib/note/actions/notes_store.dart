

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/topic/model/topic.dart';

const String notesCollection = 'notes';

Future<Note> addNote(UserDetails user, Topic topic, Note note) async {
    final Map<String, String> data = <String, String>{
    'title': note.title,
    'topicId': topic.uid,
    'userId': user.uid,
    'contents': note.contents,
  };

  print('Creating Note: ${note.title}, topic: ${topic.title}, for user: ${user.uid}');
  final DocumentReference doc =
      Firestore.instance.collection(notesCollection).document();
  await doc.setData(data);
  return Note(title: topic.title, uid: doc.documentID, contents: note.contents);
}

Stream<QuerySnapshot> fetchNotes(UserDetails user, Topic topic) {
  return Firestore.instance.collection(notesCollection).snapshots();
}
