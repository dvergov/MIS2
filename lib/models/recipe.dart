class Recipe {
  final String id;
  final String name;
  final String instructions;
  final String imageUrl;
  final String? youtubeUrl;
  final List<Ingredient> ingredients;

  Recipe({
    required this.id,
    required this.name,
    required this.instructions,
    required this.imageUrl,
    this.youtubeUrl,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredients = [];

    // Extract ingredients and measures (up to 20)
    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] ?? '';
      String measure = json['strMeasure$i'] ?? '';

      if (ingredient.trim().isNotEmpty) {
        ingredients.add(Ingredient(
          name: ingredient,
          measure: measure,
        ));
      }
    }

    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      instructions: json['strInstructions'] ?? '',
      imageUrl: json['strMealThumb'],
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
    );
  }
}

class Ingredient {
  final String name;
  final String measure;

  Ingredient({
    required this.name,
    required this.measure,
  });
}