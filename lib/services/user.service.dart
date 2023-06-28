import '../app/interceptor/api.interceptor.dart';

class UserService extends ApiInterceptor {
  UserService([token = ""]) : super(token);

  /// Get Users
  getUsers(Map payload) async {
    return await super.get('/users', payload, false);
  }

  /// Get User Details
  getUserDetails(int id) async {
    return await super.get('/users/$id', {}, false);
  }

  /// Add User
  addUser(Map payload) async {
    return await super.post('/users', payload);
  }

  /// Patch User
  patchUser(int id, Map payload) async {
    return await super.patch('/users/$id', payload);
  }

  /// Change Password
  changePassword(Map payload) async {
    return await super.patch("/users/password/change", payload);
  }

}