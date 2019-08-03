

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  SecureStore._(this._store);
  final FlutterSecureStorage _store;

  static final SecureStore instance = SecureStore._(FlutterSecureStorage());

  Future<String> get({String key}) async {
    return await _store.read(key: key);
  }

  Future<void> put({String key, String value}) async {
    return await _store.write(key: key, value: value);
  }

  Future<void> deleteAll() async {
    return await _store.deleteAll();
  }

}