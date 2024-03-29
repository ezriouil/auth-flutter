import 'package:get_storage/get_storage.dart';

class LocalStorage {
  LocalStorage._();

// - - - - - - - - - - - - - - - - - -  INSERT OR UPDATE - - - - - - - - - - - - - - - - -  //
  static Future<bool> upsert(
      {required String key,
      required dynamic value,
      required GetStorage storage}) async {
    try {
      await storage.write(key, value);
      return true;
    } catch (_) {
      return false;
    }
  }

// - - - - - - - - - - - - - - - - - -  READ - - - - - - - - - - - - - - - - - -  //
  static dynamic read({required String key, required GetStorage storage}) {
    try {
      return storage.read(key);
    } catch (_) {
      return null;
    }
  }

// - - - - - - - - - - - - - - - - - - REMOVE- - - - - - - - - - - - - - - - - -  //
  static Future<bool> remove(
      {required String key, required GetStorage storage}) async {
    try {
      await storage.remove(key);
      return true;
    } catch (_) {
      return false;
    }
  }

// - - - - - - - - - - - - - - - - - - CLEAR - - - - - - - - - - - - - - - - - -  //
  static Future<bool> clear({required GetStorage storage}) async {
    try {
      await storage.erase();
      return true;
    } catch (_) {
      return false;
    }
  }
}
