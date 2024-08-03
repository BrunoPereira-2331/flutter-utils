import 'dart:async';

abstract class Storage {
  dynamic read({required String key});
  Future<void> write({required String key, required dynamic data});
  Future<void> delete({required String key});
  Future<void> clear();
}