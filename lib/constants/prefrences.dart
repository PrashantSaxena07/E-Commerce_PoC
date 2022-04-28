import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const isUserLogin = "isUserLogin";
  static const userToken = "userToken";
  static const language = "language";

  static late SharedPreferences _prefs;
  static Map<String, dynamic> _memoryPrefs = Map<String, dynamic>();


  static Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> clearPref() async {
    bool clear = await _prefs.clear();
    if (clear) {
      _memoryPrefs.clear();
    }
    return clear;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setListString(String key, List<String> value) {
    _prefs.setStringList(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String? getString(String key, {String? def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getString(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static List<String>? getListString(String key, {List<String>? def}) {
    List<String>? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getStringList(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static bool exists(String key, {String? def}) {
    return _prefs.containsKey(key);
  }

  static int? getInt(String key, {int? def}) {
    int? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getInt(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static double? getDouble(String key, {double? def}) {
    double? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getDouble(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static bool? getBool(String key, {bool def = false}) {
    bool? val = def;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (_prefs == null) {
      return val;
    }
    val = _prefs.getBool(key);
    if (val == null) val = def;
    _memoryPrefs[key] = val;
    return val;
  }
}
