import 'package:meal_planner/features/auth/repository/user_repository.dart';

class AuthService {
  AuthService(this._userRepository);

  final UserRepository _userRepository;

  Future<bool> authenticate({
    required String login,
    required String password,
  }) async {
    final user = await _userRepository.findUser(
      login: login,
      password: password,
    );

    return user != null;
  }
}