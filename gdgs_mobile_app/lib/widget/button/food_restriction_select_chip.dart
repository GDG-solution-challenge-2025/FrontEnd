import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';

class FoodRestrictionSelectChip extends StatefulWidget {
  FoodRestrictionSelectChip({
    super.key,
    required this.foodName,
    required this.selected,
    this.onTap,
    this.onLongPress,
  });

  String foodName;
  bool selected;
  Function(bool)? onTap;
  Function()? onLongPress;

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
      child: InkWell(
        onLongPress: () {
          if (widget.onLongPress != null) {
            widget.onLongPress!();
          }
        },
        child: ChoiceChip(
          showCheckmark: false,
          selected: widget.selected,
          onSelected: (value) {
            if (widget.onTap != null) {
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
      ),
    );
  }
}
