import 'package:petal_book/core/user/actions/auth.dart';
import 'package:petal_book/core/user/model/user_details.dart';
import 'package:petal_book/topic/actions/topic_store.dart';
import 'package:petal_book/topic/model/topic.dart';

Future<Topic> setupBasicTopic(UserDetails user) async {
  if (user == null) {
    print('User is null....');
    return null;
  }
  final Topic topic = Topic(title: 'Others');
  final Topic existingTopic = await fetchTopic(user, 'Others');
  if (existingTopic == null) {
    final Topic newTopic = await createTopic(user, topic);
    print('Created new Topic with id: ${newTopic.id}');
    return newTopic;
  }
  print('Found existing topic. Returning with id: ${existingTopic.id}');
  return existingTopic;
}

Future<UserDetails> setUpNewAnonymousUser() async {
  print('Setting up new user....');
  final UserDetails user = await signInAnonymously();
  return user;
}
