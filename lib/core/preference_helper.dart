import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const String languageType = "languageType";
  static const String userData = "userData";
  static const String userID = "userID";
  static const String mobile = "mobile";
  static const String isLOGIN = "is_login";
  static const String isVENDOR = "is_vendor";
  static const String isCUSTOMER = "is_customer";
  static const String isBOTH = "is_both";
  static const String isPage = "isPageClick";
  static const String isUserType = "isUserType";
  static const String isProfilePage = "isProfilePage";
  static const String tempMobile = "tempMobile";

  static const String keyUserData = "USER_DATA";
  static const String isUserDataSet = "false";
  static const String FAB = "Vendor";
  static const String SELECTED_CUSTOMER = "SELECTED_CUSTOMER";
  static const String SELECTED_VENDOR = "SELECTED_VENDOR";

  static SharedPreferences? prefs;

  static const THEME_KEY = "theme_key";
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

  static clear({required String key, required bool value}) async {
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

  setTheme(bool value) async {
    prefs?.setBool(THEME_KEY, value);
  }

  getTheme() async {
    return prefs?.getBool(THEME_KEY) ?? false;
  }
}
