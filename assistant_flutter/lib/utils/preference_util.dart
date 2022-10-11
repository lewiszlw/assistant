import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {

  static SharedPreferences? prefs;

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setString(String key, String value) {
    prefs?.setString(key, value);
  }

  String? getString(String key) {
    return prefs?.getString(key);
  }

  String getStringOrDefault(String key, String defaultValue) {
    return prefs?.getString(key) ?? defaultValue;
  }
}