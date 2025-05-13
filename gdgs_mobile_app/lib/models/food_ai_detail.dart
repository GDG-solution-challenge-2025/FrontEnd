// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FoodAiDetail {
  int sidx;
  String imgUri;
  String food;
  String description;
  String origin;
  String howToEat;
  List<String> ingredients;
  List<String> cantIngredients;
  FoodAiDetail({
    required this.sidx,
    required this.imgUri,
    required this.food,
    required this.description,
    required this.origin,
    required this.howToEat,
    required this.ingredients,
    required this.cantIngredients,
  });

  FoodAiDetail copyWith({
    int? sidx,
    String? imgUri,
    String? food,
    String? description,
    String? origin,
    String? howToEat,
    List<String>? ingredients,
    List<String>? cantIngredients,
  }) {
    return FoodAiDetail(
      sidx: sidx ?? this.sidx,
      imgUri: imgUri ?? this.imgUri,
      food: food ?? this.food,
      description: description ?? this.description,
      origin: origin ?? this.origin,
      howToEat: howToEat ?? this.howToEat,
      ingredients: ingredients ?? this.ingredients,
      cantIngredients: cantIngredients ?? this.cantIngredients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sidx': sidx,
      'imgUri': imgUri,
      'food': food,
      'description': description,
      'origin': origin,
      'howToEat': howToEat,
      'ingredients': ingredients,
      'cantIngredients': cantIngredients,
    };
  }

  factory FoodAiDetail.fromMap(Map<String, dynamic> map) {
    return FoodAiDetail(
      sidx: map['sidx'] as int,
      imgUri: map['imgUri'] as String,
      food: map['food'] as String,
      description: map['description'] as String,
      origin: map['origin'] as String,
      howToEat: map['howToEat'] as String,
      ingredients: List<String>.from(map['ingredients'] as List<String>),
      cantIngredients:
          List<String>.from(map['cantIngredients'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodAiDetail.fromJson(String source) =>
      FoodAiDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodAiDetail(sidx: $sidx, imgUri: $imgUri, food: $food, description: $description, origin: $origin, howToEat: $howToEat, ingredients: $ingredients, cantIngredients: $cantIngredients)';
  }

  @override
  bool operator ==(covariant FoodAiDetail other) {
    if (identical(this, other)) return true;

    return other.sidx == sidx &&
        other.imgUri == imgUri &&
        other.food == food &&
        other.description == description &&
        other.origin == origin &&
        other.howToEat == howToEat &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.cantIngredients, cantIngredients);
  }

  @override
  int get hashCode {
    return sidx.hashCode ^
        imgUri.hashCode ^
        food.hashCode ^
        description.hashCode ^
        origin.hashCode ^
        howToEat.hashCode ^
        ingredients.hashCode ^
        cantIngredients.hashCode;
  }
}
