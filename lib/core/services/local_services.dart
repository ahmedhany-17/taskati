import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box taskBox;

  static init() {
    userBox = Hive.box('userBox');
    taskBox = Hive.box('taskBox');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCachedTask(String key) {
    return userBox.get(key);
  }
}