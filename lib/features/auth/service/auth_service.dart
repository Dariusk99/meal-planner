class AuthService {
  static const String _validLogin = 'login';
  static const String _validPassword = 'password';

  bool authenticate({
    required String login,
    required String password,
  }) {
    return login == _validLogin &&
        password == _validPassword;
  }
}