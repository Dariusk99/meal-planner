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

  Future<List<Recipe>> getRecipes() async {
    final database = await _recipeDatabase.database;

    final result = await database.query(
      'recipes',
      orderBy: 'id DESC',
    );

    return result.map(Recipe.fromMap).toList();
  }

  Future<int> updateRecipe(Recipe recipe) async {
    final database = await _recipeDatabase.database;

    return database.update(
      'recipes',
      recipe.toMap(),
      where: 'id = ?',
      whereArgs: [recipe.id],
    );
  }

  Future<int> deleteRecipe(int id) async {
    final database = await _recipeDatabase.database;

    return database.delete(
      'recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}