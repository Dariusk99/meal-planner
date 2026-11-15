import 'package:flutter/material.dart';

import 'package:meal_planner/features/auth/service/session_service.dart';
import 'package:meal_planner/features/auth/view/signin_screen.dart';
import 'package:meal_planner/features/recipe/model/recipe.dart';
import 'package:meal_planner/features/recipe/repository/recipe_repository.dart';
import 'package:meal_planner/features/recipe/service/recipe_database.dart';
import 'package:meal_planner/features/recipe/view/add_recipe_screen.dart';
import 'package:meal_planner/features/recipe/view/recipe_edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color _primaryPurple = Color(0xFF471AA0);

  final SessionService _sessionService = SessionService();

  final RecipeRepository _recipeRepository = RecipeRepository(
    RecipeDatabase(),
  );

  late Future<List<Recipe>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _recipesFuture = Future.value([]);
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    final userId = await _sessionService.getUserId();

    if (userId == null) {
      _recipesFuture = Future.value([]);

      if (mounted) {
        setState(() {});
      }

      return;
    }

    _recipesFuture = _recipeRepository.getRecipesForUser(userId);

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _signOut() async {
    await _sessionService.clearLoginSession();

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (_) => const SignInScreen(),
      ),
          (route) => false,
    );
  }

  Future<void> _openRecipe(Recipe recipe) async {
    final wasEdited = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => RecipeEditScreen(
          recipe: recipe,
        ),
      ),
    );

    if (wasEdited ?? false) {
      await _loadRecipes();
    }
  }

  Future<void> _openAddRecipe() async {
    final wasAdded = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => const AddRecipeScreen(),
      ),
    );

    if (wasAdded ?? false) {
      await _loadRecipes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: _primaryPurple,
        elevation: 0,
        title: const Text(
          'Meal Planner',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _signOut,
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _primaryPurple,
        foregroundColor: Colors.white,
        onPressed: _openAddRecipe,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final recipes = snapshot.data ?? [];

          if (recipes.isEmpty) {
            return const Center(
              child: Text(
                'No recipes yet',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: recipes.length,
            separatorBuilder: (_, _) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              final recipe = recipes[index];

              return ListTile(
                onTap: () => _openRecipe(recipe),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(
                    color: Color(0xFFB678E6),
                  ),
                ),
                title: Text(
                  recipe.name,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text(
                  recipe.ingredients,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: _primaryPurple,
                ),
              );
            },
          );
        },
      ),
    );
  }
}