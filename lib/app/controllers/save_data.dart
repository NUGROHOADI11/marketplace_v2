import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserId(String id) async {
    await preferences!.setString("userId", id);
  }

  static String getUserId() {
    return preferences!.getString("userId") ?? "";
  
  }
  static Future<void> saveUsername(String name) async {
    await preferences!.setString("username", name);
  }

  static String getUsername() {
    return preferences!.getString("username") ?? "";
  }
  static Future<void> saveEmail(String email) async {
    await preferences!.setString("email", email);
  }

  static String getEmail() {
    return preferences!.getString("email") ?? "";
  }
}
