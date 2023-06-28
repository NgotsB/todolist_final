import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /// Check If Token Exist
  Future<bool> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token") ? true : false;
  }

  /// Store User Details
  setUserDetails(user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("user", user);
  }

  /// Get User Details
  getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  /// Remove User Details
  removeUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  /// Get User Token
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  /// Get User Token
  setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  /// Remove User Token
  removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  /// Set User Credentials
  setUserCredentials(String creds) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("creds", creds);
  }

  /// Get User Credentials
  getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("creds");
  }
}
