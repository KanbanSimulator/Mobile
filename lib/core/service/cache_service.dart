import 'package:kanban/const/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static void store(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value.runtimeType == String) prefs.setString(key, value);
    if (value.runtimeType == int) prefs.setInt(key, value);
    if (value.runtimeType == bool) prefs.setBool(key, value);
  }

  static void clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("userId");
  }

  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username") ?? AppConst.unnamed;
  }

  static Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("userId") ?? AppConst.undefined;
  }
}
