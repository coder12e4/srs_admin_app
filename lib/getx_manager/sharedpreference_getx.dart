import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager extends GetxService {
   SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  String getStringValue(String key) {
    
    return _prefs!.getString(key) ?? '';
  }
}
