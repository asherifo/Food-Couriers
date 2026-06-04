// file: recipe_model.dart

class RecipeModel {
  final int id;
  final String title;
  final String image;
  final double rating; //  aggregateLikes سنحوله لتقييم من 5
  final int readyInMinutes;
  final String summary;
  final double price; // سنقوم بحساب سعر تقريبي من pricePerServing
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.readyInMinutes,
    required this.summary,
    required this.price,
    required this.ingredients,
  });

  // Factory layer لعمل Parsing للـ JSON القادم من Dio
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    // تحويل الـ aggregateLikes إلى تقييم منطقي بين 3.5 و 5.0 ليناسب التصميم
    double calculatedRating = 4.0 + ((json['aggregateLikes'] ?? 0) % 10) / 10;
    if (calculatedRating > 5.0) calculatedRating = 5.0;

    // تحويل السعر من سنت (Cents) إلى دولار، أو وضع سعر عشوائي منطقي للتصميم
    double calculatedPrice = (json['pricePerServing'] ?? 1500) / 100;
    if (calculatedPrice == 0) calculatedPrice = 15.0;

    // استخراج المكونات في قائمة نصوص
    List<String> ingredientsList = [];
    if (json['extendedIngredients'] != null) {
      json['extendedIngredients'].forEach((v) {
        ingredientsList.add(v['original'] ?? '');
      });
    }

    return RecipeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Dish',
      image: json['image'] ?? 'https://via.placeholder.com/150',
      rating: double.parse(calculatedRating.toStringAsFixed(1)),
      readyInMinutes: json['readyInMinutes'] ?? 30,
      // تنظيف النص من وسوم HTML إن وجدت في الـ summary
      summary: (json['summary'] ?? '').replaceAll(RegExp(r'<[^>]*>'), ''),
      price: double.parse(calculatedPrice.toStringAsFixed(2)),
      ingredients: ingredientsList,
    );
  }
}