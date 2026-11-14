import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String _isLoggedInKey = 'isLoggedIn';

  Future<void> saveLoginSession() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool(
      _isLoggedInKey,
      true,
    );
  }

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> clearLoginSession() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove(_isLoggedInKey);
  }
}