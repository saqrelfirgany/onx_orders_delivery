import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String token = '';
  static String deviceToken = 'Helper.deviceToken';
  static bool isLoggedIn = false;
  static String lang = 'en';

  static String userLoggedKey = 'IsLoggedIn';
  static String userTokenKey = 'UserToken';
  static String userLangKey = 'userLang';

  /// Save User Logged
  static Future<bool> saveUserLogged(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(userLoggedKey, isLoggedIn);
  }

  /// Get User Logged
  static getUserLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(userLoggedKey);
  }

  /// Save User Token
  static Future<bool> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(userTokenKey, token);
  }

  /// Get User Token
  static getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(userTokenKey) ?? '';
  }

  /// Save User Lang
  static Future<bool> saveUserLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(userLangKey, lang);
  }

  /// Get User Lang
  static getUserLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(userLangKey) ?? '';
  }
}
