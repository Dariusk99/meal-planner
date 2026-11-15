import 'package:meal_planner/features/recipe/model/recipe.dart';
import 'package:meal_planner/features/recipe/service/recipe_database.dart';

class RecipeRepository {
  RecipeRepository(this._recipeDatabase);

  final RecipeDatabase _recipeDatabase;

  Future<int> addRecipe(Recipe recipe) async {
    final database = await _recipeDatabase.database;

    return database.insert(
      'recipes',
      recipe.toMap(),
    );
  }

  Future<List<Recipe>> getRecipesForUser(int userId) async {
    final database = await _recipeDatabase.database;

    final result = await database.query(
      'recipes',
      where: 'userId = ?',
      whereArgs: [userId],
      orderBy: 'id DESC',
    );

    return result.map(Recipe.fromMap).toList();
  }

  Future<int> updateRecipe(Recipe recipe) async {
    final database = await _recipeDatabase.database;

    return database.update(
      'recipes',
      recipe.toMap(),
      where: 'id = ? AND userId = ?',
      whereArgs: [
        recipe.id,
        recipe.userId,
      ],
    );
  }

  Future<int> deleteRecipe(
      int id,
      int userId,
      ) async {
    final database = await _recipeDatabase.database;

    return database.delete(
      'recipes',
      where: 'id = ? AND userId = ?',
      whereArgs: [
        id,
        userId,
      ],
    );
  }
}