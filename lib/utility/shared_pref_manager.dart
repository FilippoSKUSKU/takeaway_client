import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  SharedPrefManager._();
  static final SharedPrefManager _instance = SharedPrefManager._();
  static SharedPrefManager get instance => _instance;
  static const tokenKey = "token_key";

  Future<void> saveToken(String token) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(tokenKey, token);
  }

  Future<String?> getToken() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(tokenKey);
  }
}
