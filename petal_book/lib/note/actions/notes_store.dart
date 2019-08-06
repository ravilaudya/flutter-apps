

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/note/model/media_model.dart';
import 'package:petal_book/note/model/note.dart';
import 'package:petal_book/topic/model/topic.dart';

const String notesCollection = 'notes';

Future<Note> addNote(UserDetails user, Topic topic, Note note) async {
  final List<Map<String, String>> assets = <Map<String, String>>[];
  if (note.media != null && note.media.isNotEmpty) {
    for (MediaModel mm in note.media) {
      const String extension = '.jpeg';
      final String fileName = Random().nextInt(10000).toString() +'.$extension';
      final StorageReference storageRef = FirebaseStorage.instance.ref().child(fileName);
      final StorageUploadTask uploadTask = storageRef.putFile(File(mm.location), StorageMetadata(contentType: extension));
      final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      final String url = await downloadUrl.ref.getDownloadURL();
      print('URL Is $url');
      assets.add(<String, String>{'location': url, 'type': 'URL'});
    }
  }
  final Map<String, dynamic> data = <String, dynamic>{
    'title': note.title,
    'topicId': topic.uid,
    'userId': user.uid,
    'contents': note.contents,
    'assets': assets,
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
