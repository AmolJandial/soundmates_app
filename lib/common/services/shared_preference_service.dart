import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final SharedPreferences sharedPref;

  const SharedPreferenceService({required this.sharedPref});

  String? getString(String key) {
    final value = sharedPref.getString(key);
    return value;
  }

  bool? getBool(String key) {
    final value = sharedPref.getBool(key);
    return value;
  }

  Future<void> setBool(bool value, String key) async {
    await sharedPref.setBool(key, value);
  }
}
