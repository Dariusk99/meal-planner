import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userIdKey = 'userId';

  Future<void> saveLoginSession(int userId) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(
      _isLoggedInKey,
      true,
    );

    await preferences.setInt(
      _userIdKey,
      userId,
    );
  }

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_isLoggedInKey) ?? false;
  }

  Future<int?> getUserId() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt(_userIdKey);
  }

  Future<void> clearLoginSession() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_isLoggedInKey);
    await preferences.remove(_userIdKey);
  }
}