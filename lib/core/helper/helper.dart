import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/intro/auth/models/user_model.dart';

class Helper {
  static String token = '';
  static String deviceToken = 'Helper.deviceToken';
  static bool isLoggedIn = false;
  static String lang = 'en';

  static String userLoggedKey = 'IsLoggedIn';
  static String userModelKey = 'userModelKey';
  static String userTokenKey = 'UserToken';
  static String userLangKey = 'userLang';

  /// Save User Logged
  static Future<bool> saveUserLogged(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(userLoggedKey, isLoggedIn);
  }

  /// Save User Logged
  static Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic dynamicResponse = await jsonEncode(userModel.toJson());

    return await prefs.setString(userModelKey, dynamicResponse);
  }

  /// Get User Logged
  static getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(userModelKey);
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
