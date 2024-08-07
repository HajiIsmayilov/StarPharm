import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserCache {
  static SharedPreferences? _prefs;

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setUser(User user) {
    try {
      _prefs!.setString('user', user.toRawJson());
    } catch (e) {
      print(e);
    }
  }

  static User? getUser() {
    User? user = null;

    try {
      String? json = _prefs!.getString('user');
      user = User.fromRawJson(json!);
    } catch (e) {
      print(e);
    }

    return user;
  }
}
