class Recipe {
  const Recipe({
    required this.name,
    required this.ingredients,
    required this.description,
    this.id,
  });

  final int? id;
  final String name;
  final String ingredients;
  final String description;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'description': description,
    };
  }

  factory Recipe.fromMap(Map<String, Object?> map) {
    return Recipe(
      id: map['id'] as int,
      name: map['name'] as String,
      ingredients: map['ingredients'] as String,
      description: map['description'] as String,
    );
  }
}