import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:petal_book/core/local_store/secure_store.dart';
import 'package:petal_book/core/user/model/user_details.dart';

const String userIdKey = 'userId';

Future<UserDetails> signInAnonymously() async {
  try {
    final AuthResult authResult =
        await FirebaseAuth.instance.signInAnonymously();
    if (authResult == null) {
      print('Auth Result is NULL.....');
      return null;
    }
    print('Auth Result... $authResult');
    final UserDetails user = UserDetails(uid: authResult.user.uid);
    SecureStore.instance.put(key: userIdKey, value: user.uid);
    return user;
  } catch (e) {
    print('Error sigining in anonymously....$e');
    return null;
  }
}

Future<UserDetails> getLoggedInUser() async {
  await SecureStore.instance.deleteAll();
  final String userId = await SecureStore.instance.get(key: userIdKey);
  if (userId == null) {
    return null;
  }
  return UserDetails(uid: userId);
}
