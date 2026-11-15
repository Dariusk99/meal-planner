import 'package:meal_planner/features/auth/service/auth_service.dart';
import 'package:meal_planner/features/auth/service/session_service.dart';

class AuthViewModel {
  AuthViewModel(
      this._authService,
      this._sessionService,
      );

  final AuthService _authService;
  final SessionService _sessionService;

  Future<bool> signIn({
    required String login,
    required String password,
  }) async {
    final user = await _authService.authenticate(
      login: login,
      password: password,
    );

    if (user == null || user.id == null) {
      return false;
    }

    await _sessionService.saveLoginSession(user.id!);

    return true;
  }

  Future<bool> isLoggedIn() {
    return _sessionService.isLoggedIn();
  }

  Future<void> signOut() {
    return _sessionService.clearLoginSession();
  }
}