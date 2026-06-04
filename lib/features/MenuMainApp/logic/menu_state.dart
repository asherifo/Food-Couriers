// file: recipe_state.dart
import '../data/menu_model.dart';


abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> homeRecipes;
  final RecipeModel? selectedRecipe; // للشاشة الثانية
  RecipeLoaded({required this.homeRecipes, this.selectedRecipe});
}

class RecipeError extends RecipeState {
  final String errorMessage;
  RecipeError({required this.errorMessage});
}