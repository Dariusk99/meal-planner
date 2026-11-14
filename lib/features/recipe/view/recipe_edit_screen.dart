import 'package:flutter/material.dart';

import 'package:meal_planner/features/recipe/model/recipe.dart';
import 'package:meal_planner/features/recipe/repository/recipe_repository.dart';
import 'package:meal_planner/features/recipe/service/recipe_database.dart';

class RecipeEditScreen extends StatefulWidget {
  const new({
    required this.recipe,
    super.key,
  });

  final Recipe recipe;

  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends State<RecipeEditScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _ingredientsController;
  late final TextEditingController _descriptionController;

  final RecipeRepository _recipeRepository = RecipeRepository(
    RecipeDatabase(),
  );

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.recipe.name,
    );

    _ingredientsController = TextEditingController(
      text: widget.recipe.ingredients,
    );

    _descriptionController = TextEditingController(
      text: widget.recipe.description,
    );
  }

  Future<void> _saveRecipe() async {
    final updatedRecipe = Recipe(
      id: widget.recipe.id,
      name: _nameController.text.trim(),
      ingredients: _ingredientsController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    await _recipeRepository.updateRecipe(updatedRecipe);

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(true);
  }

  Future<void> _deleteRecipe() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete recipe'),
          content: const Text(
            'Are you sure you want to delete this recipe?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (!(shouldDelete ?? false)) {
      return;
    }

    final recipeId = widget.recipe.id;

    if (recipeId == null) {
      return;
    }

    await _recipeRepository.deleteRecipe(recipeId);

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
        title: const Text('Edit recipe'),
        actions: [
          IconButton(
            onPressed: _deleteRecipe,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ],
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