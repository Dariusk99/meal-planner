import 'package:meal_planner/features/auth/model/user.dart';
import 'package:meal_planner/features/auth/repository/user_repository.dart';

class AuthService {
  AuthService(this._userRepository);

  final UserRepository _userRepository;

  Future<User?> authenticate({
    required String login,
    required String password,
  }) {
    return _userRepository.findUser(
      login: login,
      password: password,
    );
  }
}