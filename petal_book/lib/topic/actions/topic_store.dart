import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/topic/model/topic.dart';

const String topicCollection = 'topics';

Future<Topic> createTopic(UserDetails user, Topic topic) async {
  final Map<String, String> data = {
    'title': topic.title,
    'userId': user.uid,
  };

  print('Creating topic: ${topic.title}, for user: ${user.uid}');
  final DocumentReference doc =
      Firestore.instance.collection(topicCollection).document();
  await doc.setData(data);
  return Topic(title: topic.title, id: doc.documentID);
}

Future<Topic> fetchTopic(UserDetails user, String title) async {
  final Query doc = Firestore.instance
      .collection(topicCollection)
      .where('title', isEqualTo: title)
      .where('userId', isEqualTo: user.uid);
  final QuerySnapshot snapshot = await doc.limit(1).getDocuments();
  if (snapshot.documents == null || snapshot.documents.isEmpty) {
    return null;
  }
  final DocumentSnapshot ds = snapshot.documents.first;
  if (ds == null) {
    return null;
  }
  return Topic(title: ds.data['title'], id: ds.documentID);
}
