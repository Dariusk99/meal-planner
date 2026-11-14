import 'package:meal_planner/features/auth/service/auth_service.dart';
import 'package:meal_planner/features/auth/service/session_service.dart';

class AuthViewModel {
  final AuthService _authService;
  final SessionService _sessionService;

  AuthViewModel(
      this._authService,
      this._sessionService,
      );

  Future<bool> signIn({
    required String login,
    required String password,
  }) async {
    final isAuthenticated = _authService.authenticate(
      login: login,
      password: password,
    );

    if (!isAuthenticated) {
      return false;
    }

    await _sessionService.saveLoginSession();

    return true;
  }

  Future<bool> isLoggedIn() {
    return _sessionService.isLoggedIn();
  }

  Future<void> signOut() {
    return _sessionService.clearLoginSession();
  }
}