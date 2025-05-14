import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/food/food_restriction.dart';
import 'package:gdgs_mobile_app/widget/button/food_restriction_select_chip.dart';

class FoodRestrictionChipList extends StatelessWidget {
  FoodRestrictionChipList({
    super.key,
    required this.foodList,
    required this.isUserSelect,
    this.onLongPress,
  });

  List<FoodRestriction> foodList;
  Function(FoodRestriction) isUserSelect;
  Function(FoodRestriction)? onLongPress;

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
              onLongPress: () {
                if (onLongPress != null) {
                  onLongPress!(foodRestrictionItem);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
