

import '../app/interceptor/api.interceptor.dart';

class AuthService extends ApiInterceptor {

  AuthService([token = ""]) : super(token);

  /// Authenticate user
  authenticate(Map payload) async {
    return await super.post("/authenticate", payload);
  }
/// Register
  register(Map body) async {
    return await super.post("/register", body);
  }

  /// Logout user
  logout() async {
    return await super.post("/logout", {});
  }
}