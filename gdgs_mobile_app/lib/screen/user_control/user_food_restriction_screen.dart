import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food_restriction.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Buttons/food_restriction_select_chip.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';

class UserFoodRestrictionScreen extends StatefulWidget {
  const UserFoodRestrictionScreen({super.key});

  @override
  State<UserFoodRestrictionScreen> createState() =>
      _UserFoodRestrictionScreenState();
}

class _UserFoodRestrictionScreenState extends State<UserFoodRestrictionScreen> {
  final List<FoodRestriction> othersFood = [
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
              ),
              ElevatedButton(
                onPressed: () {},
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

class FoodRestrictionChipList extends StatelessWidget {
  FoodRestrictionChipList({
    super.key,
    required this.foodList,
    required this.isUserSelect,
  });

  List<FoodRestriction> foodList;
  Function(FoodRestriction) isUserSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: foodList
          .map(
            (foodRestrictionItem) => FoodRestrictionSelectChip(
              foodName: foodRestrictionItem.foodName,
              selected: foodRestrictionItem.selected,
              onTap: (selected) {
                foodRestrictionItem.selected = selected;
                print(
                    'chip => ${foodRestrictionItem.foodName} // ${foodRestrictionItem.selected}');
                isUserSelect(foodRestrictionItem);
              },
            ),
          )
          .toList(),
    );
  }
}

class FoodRestrictionTitle extends StatelessWidget {
  FoodRestrictionTitle({
    super.key,
    required this.title,
    required this.foodIcon,
  });

  String title;
  String foodIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(
          text: "$title ",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: titleTextColor,
              ),
        ),
        if (foodIcon != imageNullMsg)
          Image.asset(
            foodIcon,
            width: 24,
            height: 24,
          ),
      ],
    );
  }
}
