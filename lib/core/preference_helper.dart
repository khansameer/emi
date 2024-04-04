import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const String isLOGIN = "is_login";
  static SharedPreferences? prefs;
  /*------------------------------------Store Data----------------------------------------*/

  static Future<SharedPreferences?> load() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  static setString({required String key, required String value}) async {
    prefs?.setString(key, value);
  }

  static setInt({required String key, required int value}) async {
    prefs?.setInt(key, value);
  }

  static setDouble({required String key, required double value}) async {
    prefs?.setDouble(key, value);
  }

  static setBool({required String key, required bool value}) async {
    prefs?.setBool(key, value);
  }

  static clear() async {
    prefs?.clear();
  }

/*------------------------------------Read Data----------------------------------------*/
  static getString({required String key}) async {
    String? stringValue = prefs?.getString(key);
    return stringValue;
  }

  static getBool({required String key}) async {
    bool? boolValue = prefs?.getBool(key);
    return boolValue;
  }

  static getInt({required String key}) async {
    int? intValue = prefs?.getInt(key);
    return intValue;
  }

  static getDouble({required String key}) async {
    double? doubleValue = prefs?.getDouble(key);
    return doubleValue;
  }
}
