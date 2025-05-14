// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FoodIngredients {
  final int? pork;
  final int? beef;
  final int? horseMeat;
  final int? chicken;
  final int? duck;
  final int? salmon;
  final int? tuna;
  final int? shrimp;
  final int? crab;
  final int? lobster;
  final int? clam;
  final int? oyster;
  final int? mussel;
  final int? scallop;
  final int? milk;
  final int? cheese;
  final int? butter;
  final int? wheat;
  final int? barley;
  final int? rice;
  final int? corn;
  final int? soybean;
  final int? peanut;
  final int? almond;
  final int? cashewNut;
  final List<String>? ingredients;
  FoodIngredients({
    this.pork,
    this.beef,
    this.horseMeat,
    this.chicken,
    this.duck,
    this.salmon,
    this.tuna,
    this.shrimp,
    this.crab,
    this.lobster,
    this.clam,
    this.oyster,
    this.mussel,
    this.scallop,
    this.milk,
    this.cheese,
    this.butter,
    this.wheat,
    this.barley,
    this.rice,
    this.corn,
    this.soybean,
    this.peanut,
    this.almond,
    this.cashewNut,
    this.ingredients,
  });

  FoodIngredients copyWith({
    int? pork,
    int? beef,
    int? horseMeat,
    int? chicken,
    int? duck,
    int? salmon,
    int? tuna,
    int? shrimp,
    int? crab,
    int? lobster,
    int? clam,
    int? oyster,
    int? mussel,
    int? scallop,
    int? milk,
    int? cheese,
    int? butter,
    int? wheat,
    int? barley,
    int? rice,
    int? corn,
    int? soybean,
    int? peanut,
    int? almond,
    int? cashewNut,
    List<String>? ingredients,
  }) {
    return FoodIngredients(
      pork: pork ?? this.pork,
      beef: beef ?? this.beef,
      horseMeat: horseMeat ?? this.horseMeat,
      chicken: chicken ?? this.chicken,
      duck: duck ?? this.duck,
      salmon: salmon ?? this.salmon,
      tuna: tuna ?? this.tuna,
      shrimp: shrimp ?? this.shrimp,
      crab: crab ?? this.crab,
      lobster: lobster ?? this.lobster,
      clam: clam ?? this.clam,
      oyster: oyster ?? this.oyster,
      mussel: mussel ?? this.mussel,
      scallop: scallop ?? this.scallop,
      milk: milk ?? this.milk,
      cheese: cheese ?? this.cheese,
      butter: butter ?? this.butter,
      wheat: wheat ?? this.wheat,
      barley: barley ?? this.barley,
      rice: rice ?? this.rice,
      corn: corn ?? this.corn,
      soybean: soybean ?? this.soybean,
      peanut: peanut ?? this.peanut,
      almond: almond ?? this.almond,
      cashewNut: cashewNut ?? this.cashewNut,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  Map<String, dynamic> toIngredientsMap() {
    return <String, dynamic>{
      'pork': pork,
      'beef': beef,
      'horseMeat': horseMeat,
      'chicken': chicken,
      'duck': duck,
      'salmon': salmon,
      'tuna': tuna,
      'shrimp': shrimp,
      'crab': crab,
      'lobster': lobster,
      'clam': clam,
      'oyster': oyster,
      'mussel': mussel,
      'scallop': scallop,
      'milk': milk,
      'cheese': cheese,
      'butter': butter,
      'wheat': wheat,
      'barley': barley,
      'rice': rice,
      'corn': corn,
      'soybean': soybean,
      'peanut': peanut,
      'almond': almond,
      'cashewNut': cashewNut,
    };
  }

  Map<String, dynamic> toOtherIngredientsMap() {
    return <String, dynamic>{
      'ingredients': ingredients,
    };
  }

  factory FoodIngredients.fromIngredientsMap(Map<String, dynamic> map) {
    return FoodIngredients(
      pork: map['pork'] as int? ?? 0,
      beef: map['beef'] as int? ?? 0,
      horseMeat: map['horseMeat'] as int? ?? 0,
      chicken: map['chicken'] as int? ?? 0,
      duck: map['duck'] as int? ?? 0,
      salmon: map['salmon'] as int? ?? 0,
      tuna: map['tuna'] as int? ?? 0,
      shrimp: map['shrimp'] as int? ?? 0,
      crab: map['crab'] as int? ?? 0,
      lobster: map['lobster'] as int? ?? 0,
      clam: map['clam'] as int? ?? 0,
      oyster: map['oyster'] as int? ?? 0,
      mussel: map['mussel'] as int? ?? 0,
      scallop: map['scallop'] as int? ?? 0,
      milk: map['milk'] as int? ?? 0,
      cheese: map['cheese'] as int? ?? 0,
      butter: map['butter'] as int? ?? 0,
      wheat: map['wheat'] as int? ?? 0,
      barley: map['barley'] as int? ?? 0,
      rice: map['rice'] as int? ?? 0,
      corn: map['corn'] as int? ?? 0,
      soybean: map['soybean'] as int? ?? 0,
      peanut: map['peanut'] as int? ?? 0,
      almond: map['almond'] as int? ?? 0,
      cashewNut: map['cashewNut'] as int? ?? 0,
    );
  }

  factory FoodIngredients.fromOtherIngredientsMap(Map<String, dynamic> map) {
    return FoodIngredients(
      ingredients: List<String>.from(map['ingredients'] as List<String>),
    );
  }

  String toIngredientsJson() => json.encode(toIngredientsMap());
  String toOtherIngredientsJson() => json.encode(toOtherIngredientsMap());

  factory FoodIngredients.fromIngredientJson(String source) =>
      FoodIngredients.fromIngredientsMap(
          json.decode(source) as Map<String, dynamic>);

  factory FoodIngredients.fromOtherIngredientJson(String source) =>
      FoodIngredients.fromOtherIngredientsMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodIngredients(pork: $pork, beef: $beef, horseMeat: $horseMeat, chicken: $chicken, duck: $duck, salmon: $salmon, tuna: $tuna, shrimp: $shrimp, crab: $crab, lobster: $lobster, clam: $clam, oyster: $oyster, mussel: $mussel, scallop: $scallop, milk: $milk, cheese: $cheese, butter: $butter, wheat: $wheat, barley: $barley, rice: $rice, corn: $corn, soybean: $soybean, peanut: $peanut, almond: $almond, cashewNut: $cashewNut, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant FoodIngredients other) {
    if (identical(this, other)) return true;

    return other.pork == pork &&
        other.beef == beef &&
        other.horseMeat == horseMeat &&
        other.chicken == chicken &&
        other.duck == duck &&
        other.salmon == salmon &&
        other.tuna == tuna &&
        other.shrimp == shrimp &&
        other.crab == crab &&
        other.lobster == lobster &&
        other.clam == clam &&
        other.oyster == oyster &&
        other.mussel == mussel &&
        other.scallop == scallop &&
        other.milk == milk &&
        other.cheese == cheese &&
        other.butter == butter &&
        other.wheat == wheat &&
        other.barley == barley &&
        other.rice == rice &&
        other.corn == corn &&
        other.soybean == soybean &&
        other.peanut == peanut &&
        other.almond == almond &&
        other.cashewNut == cashewNut &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return pork.hashCode ^
        beef.hashCode ^
        horseMeat.hashCode ^
        chicken.hashCode ^
        duck.hashCode ^
        salmon.hashCode ^
        tuna.hashCode ^
        shrimp.hashCode ^
        crab.hashCode ^
        lobster.hashCode ^
        clam.hashCode ^
        oyster.hashCode ^
        mussel.hashCode ^
        scallop.hashCode ^
        milk.hashCode ^
        cheese.hashCode ^
        butter.hashCode ^
        wheat.hashCode ^
        barley.hashCode ^
        rice.hashCode ^
        corn.hashCode ^
        soybean.hashCode ^
        peanut.hashCode ^
        almond.hashCode ^
        cashewNut.hashCode ^
        ingredients.hashCode;
  }
}
