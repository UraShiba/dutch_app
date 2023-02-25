import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider {
  static const String authToken = 'auth_token';
  Future<void> saveData(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(authToken, token);
  }

  Future<String?> readData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(authToken);
  }

  static void removeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(authToken);
  }
}
