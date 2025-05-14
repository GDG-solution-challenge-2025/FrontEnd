import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gdgs_mobile_app/models/food/food_ingredients.dart';
import 'package:gdgs_mobile_app/service/api_service.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';

class FoodRestrictionService {
  static Future<FoodIngredients?> foodOtherIngredientsGet() async {
    final session = await TokenStorage().getToken();
    if (session != null) {
      try {
        final response = await ApiService.instanse.get(
          ApiService.othersIngredients,
          data: {
            "session": session,
          },
        );
        if (response.statusCode == StateCode.success) {
          return FoodIngredients.fromOtherIngredientJson(
              response.data["ingredients"]);
        } else {
          ApiService.printErrorMsage("foodOtherIngredientsGet", response);
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return null;
  }

  static Future<FoodIngredients?> foodOtherIngredientsSet(
      List<String> ingredients) async {
    final session = await TokenStorage().getToken();
    if (session != null) {
      try {
        final response = await ApiService.instanse.put(
          ApiService.othersIngredients,
          data: {
            "session": session,
            "ingredients": json.encode(ingredients),
          },
        );
        if (response.statusCode == StateCode.success) {
          return FoodIngredients.fromOtherIngredientJson(
              response.data["ingredients"]);
        } else {
          ApiService.printErrorMsage("foodOtherIngredientsSet", response);
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return null;
  }

  static Future<bool?> foodOtherIngredientsDelete(
      List<String> ingredients) async {
    final session = await TokenStorage().getToken();
    if (session != null) {
      try {
        final response = await ApiService.instanse.delete(
          ApiService.othersIngredients,
          data: {
            "session": session,
            "ingredients": json.encode(ingredients),
          },
        );
        if (response.statusCode == StateCode.success) {
          return true;
        } else {
          ApiService.printErrorMsage("foodOtherIngredientsDelete", response);
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return null;
  }

  static Future<FoodIngredients?> foodIngredientsGet() async {
    final session = await TokenStorage().getToken();
    if (session != null) {
      try {
        final response = await ApiService.instanse.delete(
          ApiService.ingredients,
          data: json.encode({
            "session": session,
          }),
        );
        if (response.statusCode == StateCode.success) {
          return FoodIngredients.fromIngredientJson(
              response.data["ingredients"]);
        } else {
          ApiService.printErrorMsage("foodIngredientsGet", response);
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return null;
  }

  static Future<FoodIngredients?> foodIngredientsSet(
      List<String> ingredients) async {
    final session = await TokenStorage().getToken();
    if (session != null) {
      try {
        final response = await ApiService.instanse.delete(
          ApiService.ingredients,
          data: {
            "session": session,
            "ingredients": json.encode(ingredients),
          },
        );
        if (response.statusCode == StateCode.success) {
          return FoodIngredients.fromIngredientJson(
              response.data["ingredients"]);
        } else {
          ApiService.printErrorMsage("foodIngredientsSet", response);
        }
      } on DioException catch (err) {
        ApiService.printErrorMsage("foodImgUpload", err.response!);
        print(err.toString());
      }
    }
    return null;
  }
}
