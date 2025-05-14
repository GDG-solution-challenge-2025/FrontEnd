import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food/food_ingredients.dart';
import 'package:gdgs_mobile_app/models/food/food_restriction.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/util/values/style_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:gdgs_mobile_app/widget/components/food_restriction_chip_list.dart';
import 'package:gdgs_mobile_app/widget/components/food_restriction_title.dart';
import 'package:gdgs_mobile_app/widget/dialog/show_cancel_delete_dialog.dart';
import 'package:gdgs_mobile_app/widget/dialog/show_ok_cancel_dialog.dart';

class UserFoodRestrictionScreen extends StatefulWidget {
  const UserFoodRestrictionScreen({super.key});

  @override
  State<UserFoodRestrictionScreen> createState() =>
      _UserFoodRestrictionScreenState();
}

class _UserFoodRestrictionScreenState extends State<UserFoodRestrictionScreen> {
  List<FoodRestriction> othersFood = [
    FoodRestriction(
      foodName: "Egg",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Alcohol",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Caffeine",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Gelatin",
      selected: false,
    ),
    FoodRestriction(
      foodName: "Honey",
      selected: false,
    ),
  ];

  List<FoodRestriction> userSelect =
      List<FoodRestriction>.empty(growable: true);

  void isUserSelect(FoodRestriction foodRestrictionItem) {
    print(
        'selected user => ${foodRestrictionItem.foodName} // ${foodRestrictionItem.selected}');

    if (userSelect.contains(foodRestrictionItem)) {
      if (!foodRestrictionItem.selected) {
        setState(() {
          userSelect.remove(foodRestrictionItem);
        });
      }
    } else {
      if (foodRestrictionItem.selected) {
        setState(() {
          userSelect.add(foodRestrictionItem);
        });
      }
    }
    print(userSelect.length);
  }

  Map<String, int> toIngredientsMap(List<FoodRestriction> restrictionList) {
    return {
      for (var restriction in restrictionList)
        restriction.foodName.toLowerCase(): restriction.selected ? 1 : 0
    };
  }

  Map<String, dynamic> toOtherIngredientsMap(
      List<FoodRestriction> restrictionList) {
    return {
      "ingredients": restrictionList.map((item) => item.foodName).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: defaultLayoutContentMargin,
            right: defaultHorizontalMargin,
            left: defaultHorizontalMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: "Food Restrictions",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              TitleText(
                text: "Please choose any ingredients you can't eat.",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Meat",
                foodIcon: foodIconPigPath,
              ),
              FoodRestrictionChipList(
                foodList: meatFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Seafood",
                foodIcon: foodIconFishPath,
              ),
              TitleText(
                text: "Fish",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodFish,
                isUserSelect: isUserSelect,
              ),
              TitleText(
                text: "Shellfish",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodShellfish,
                isUserSelect: isUserSelect,
              ),
              TitleText(
                text: "Mollusks",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: titleTextColor,
                    ),
              ),
              FoodRestrictionChipList(
                foodList: seaFoodMollusks,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Dairy",
                foodIcon: foodIconDairyPath,
              ),
              FoodRestrictionChipList(
                foodList: dairyFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Grains & Legumes",
                foodIcon: foodIconSoybeanPath,
              ),
              FoodRestrictionChipList(
                foodList: grainsAndLegumesFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Nuts",
                foodIcon: foodIconAlmondPath,
              ),
              FoodRestrictionChipList(
                foodList: nutsFood,
                isUserSelect: isUserSelect,
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              FoodRestrictionTitle(
                title: "Others",
                foodIcon: imageNullMsg,
              ),
              FoodRestrictionChipList(
                foodList: othersFood,
                isUserSelect: isUserSelect,
                onLongPress: (item) async {
                  final itemIndex = othersFood.indexOf(item);
                  if (itemIndex != -1) {
                    final changFoodName =
                        await ShowModifyDialog.showTextModifytDialog(
                            context, othersFood[itemIndex].foodName);
                    if (changFoodName != null) {
                      setState(() {
                        othersFood[itemIndex].foodName = changFoodName;
                      });
                    } else {
                      setState(() {
                        othersFood.removeAt(itemIndex);
                      });
                    }
                  }
                },
              ),
              ChoiceChip(
                label: Text(
                  "ingredient",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: chipTextColor,
                      ),
                ),
                selected: false,
                selectedColor: chipSelectColor,
                backgroundColor: chipUnSelectColor,
                showCheckmark: false,
                avatar: const Icon(
                  Icons.add,
                  size: 16.0,
                  color: chipTextColor,
                ),
                onSelected: (selected) async {
                  print("못 먹는 음식 추가 >> 시작");
                  final value =
                      await ShowOkCancelDialog.showTextInputDialog(context);
                  print("못 먹는 음식 추가 >> 값 받아오기 $value");
                  if (value != null && value.isNotEmpty) {
                    print("못 먹는 음식 추가 >> list에 추가");
                    setState(() {
                      final addItme = FoodRestriction(
                        foodName: value,
                        selected: true,
                      );
                      othersFood.add(addItme);
                      isUserSelect(addItme);
                    });
                    print("못 먹는 음식 추가 >> list = ${othersFood.last.foodName}");
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  var userSelectList = userSelect
                      .where((item) =>
                          othersFood
                              .firstWhere(
                                (subItem) => item.foodName == subItem.foodName,
                                orElse: () => FoodRestriction(
                                    foodName: "null", selected: false),
                              )
                              .foodName ==
                          "null")
                      .toList();
                  var userSelectOtherList = userSelect
                      .where((item) =>
                          othersFood
                              .firstWhere(
                                (subItem) => item.foodName == subItem.foodName,
                                orElse: () => FoodRestriction(
                                    foodName: "null", selected: false),
                              )
                              .foodName !=
                          "null")
                      .toList();
                  final foodFormat = toIngredientsMap(userSelectList);
                  final foodIngredients =
                      FoodIngredients.fromIngredientsMap(foodFormat);
                  final foodOtherIngredients =
                      toOtherIngredientsMap(userSelectOtherList);
                  print("$foodIngredients");
                  print(json.encode(foodOtherIngredients));
                  print(json.encode(userSelectList));
                  print(json.encode(userSelectOtherList));
                },
                style: defaultElavetionBtnStyle,
                child: const Text(
                  "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
