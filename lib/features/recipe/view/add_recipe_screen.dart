import 'package:flutter/material.dart';

import 'package:meal_planner/features/auth/service/session_service.dart';
import 'package:meal_planner/features/recipe/model/recipe.dart';
import 'package:meal_planner/features/recipe/repository/recipe_repository.dart';
import 'package:meal_planner/features/recipe/service/recipe_database.dart';

class AddRecipeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final RecipeRepository _recipeRepository = RecipeRepository(
    RecipeDatabase(),
  );

  final SessionService _sessionService = SessionService();

  Future<void> _saveRecipe() async {
    final userId = await _sessionService.getUserId();

    if (userId == null) {
      return;
    }

    final recipe = Recipe(
      userId: userId,
      name: _nameController.text.trim(),
      ingredients: _ingredientsController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    await _recipeRepository.addRecipe(recipe);

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ingredientsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Recipe name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ingredientsController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Ingredients',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveRecipe,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}