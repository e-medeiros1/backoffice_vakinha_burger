import 'dart:html';

import 'session_storage.dart';

class SessionStorageImpl implements SessionStorage {
  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  @override
  void clean() => window.sessionStorage.clear();
}
