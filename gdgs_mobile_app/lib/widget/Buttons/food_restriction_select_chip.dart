import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';

class FoodRestrictionSelectChip extends StatefulWidget {
  FoodRestrictionSelectChip({
    super.key,
    required this.foodName,
    required this.selected,
    this.onTap,
  });

  String foodName;
  bool selected;
  Function(bool)? onTap;

  @override
  State<FoodRestrictionSelectChip> createState() =>
      _FoodRestrictionSelectChipState();
}

class _FoodRestrictionSelectChipState extends State<FoodRestrictionSelectChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8.0,
      ),
      child: ChoiceChip(
        showCheckmark: false,
        selected: widget.selected,
        onSelected: (value) {
          if (widget.onTap != null) {
            print("opTap in on selected $value");
            widget.onTap!(value);
          }
        },
        selectedColor: chipSelectColor,
        backgroundColor: chipUnSelectColor,
        label: Text(
          widget.foodName,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: chipTextColor,
              ),
        ),
      ),
    );
  }
}
