import 'package:kanban/const/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {

  static void clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
  }

  static Future<String> getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username") ?? AppConst.unnamed;
  }
}