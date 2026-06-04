// file: api_service.dart
import 'dart:async';

import 'package:dio/dio.dart';
import '../data/menu_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'menu_state.dart';




class ApiServiceMenu {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.spoonacular.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String _apiKey = '4da16c4983924c28b6bf693e79758bc4'; // ضع مفتاحك هنا

  // 1. جلب قائمة وصفات عشوائية للشاشة الرئيسية (الصفحة الأولى)
  Future<List<RecipeModel>> getRandomRecipes({int number = 10}) async {
    try {
      final response = await _dio.get(
        'recipes/random',
        queryParameters: {
          'apiKey': _apiKey,
          'number': number,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['recipes'];
        return results.map((recipe) => RecipeModel.fromJson(recipe)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Error fetching recipes: $e');
    }
  }

  // 2. جلب تفاصيل وصفة معينة لشاشة التفاصيل (الصفحة الثانية)
   Future<RecipeModel> getRecipeDetails(int id) async {
    try {
      final response = await _dio.get(
        'recipes/$id/information',
        queryParameters: {
          'apiKey': _apiKey,
          'includeNutrition': false,
        },
      );

      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load recipe details');
      }
    } catch (e) {
      throw Exception('Error fetching details: $e');
    }
  }
}



class RecipeCubit extends Cubit<RecipeState> {
  final ApiServiceMenu apiService;
  List<RecipeModel> _cachedHomeRecipes = [];

  RecipeCubit({required this.apiService}) : super(RecipeInitial());

  // استدعاء البيانات للشاشة الرئيسية
   Future<void> fetchHomeRecipes() async {
    emit(RecipeLoading());
    try {
      final recipes = await apiService.getRandomRecipes(number: 10);
      _cachedHomeRecipes = recipes;
      emit(RecipeLoaded(homeRecipes: recipes));
    } catch (e) {
      emit(RecipeError(errorMessage: e.toString()));
    }
  }

  // استدعاء بيانات شاشة التفاصيل عند الضغط على منتج
   Future<void> fetchRecipeDetails(int recipeId) async {
    emit(RecipeLoading());
    try {
      final details = await apiService.getRecipeDetails(recipeId);
      emit(RecipeLoaded(homeRecipes: _cachedHomeRecipes, selectedRecipe: details));
    } catch (e) {
      emit(RecipeError(errorMessage: e.toString()));
    }
  }
}