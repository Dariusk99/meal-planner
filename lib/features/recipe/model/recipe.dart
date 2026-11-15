class Recipe {
  const Recipe({
    required this.userId,
    required this.name,
    required this.ingredients,
    required this.description,
    this.id,
  });

  final int? id;
  final int userId;
  final String name;
  final String ingredients;
  final String description;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'ingredients': ingredients,
      'description': description,
    };
  }

  factory Recipe.fromMap(Map<String, Object?> map) {
    return Recipe(
      id: map['id'] as int,
      userId: map['userId'] as int,
      name: map['name'] as String,
      ingredients: map['ingredients'] as String,
      description: map['description'] as String,
    );
  }
}