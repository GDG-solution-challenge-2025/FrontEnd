import 'package:gdgs_mobile_app/models/food_ai_detail.dart';

enum FoodPostLiked { unable, enable }

class FoodLikePost extends FoodAiDetail {
  FoodPostLiked liked;
  FoodLikePost({
    required super.sidx,
    required super.imgUri,
    required super.food,
    required super.description,
    required super.origin,
    required super.howToEat,
    required super.ingredients,
    required super.cantIngredients,
    required this.liked,
  });
}
