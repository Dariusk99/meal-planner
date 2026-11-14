import 'package:meal_planner/features/auth/model/user.dart';
import 'package:meal_planner/features/recipe/service/recipe_database.dart';

class UserRepository {
  UserRepository(this._databaseService);

  final RecipeDatabase _databaseService;

  Future<int> register(User user) async {
    final database = await _databaseService.database;

    return database.insert(
      'users',
      user.toMap(),
    );
  }

  Future<User?> findUser({
    required String login,
    required String password,
  }) async {
    final database = await _databaseService.database;

    final result = await database.query(
      'users',
      where: '(username = ? OR email = ?) AND password = ?',
      whereArgs: [
        login,
        login,
        password,
      ],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return User.fromMap(result.first);
  }
}