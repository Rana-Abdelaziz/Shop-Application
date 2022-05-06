import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences prefs;

  static inti() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<dynamic> putData(String key, dynamic value) async {
    if (value is String) return await prefs.setString(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is bool) return await prefs.setBool(key, value);
    return await prefs.setDouble(key, value);
  }

  static dynamic getData(String key) {
    return prefs.get(key);
  }
}
