import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static Future write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
