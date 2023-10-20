import 'package:project4/MainPages/switch_button_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchButtonServices extends ISwitchButton {
  @override
  Future<Object?> getK(String key) async {
    final prefs = await SharedPreferences.getInstance();
    Object? isDark = prefs.get(key);
    if (isDark == null) {
      return false;
    } else {
      return isDark;
    }
  }

  @override
  Future delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future put(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
