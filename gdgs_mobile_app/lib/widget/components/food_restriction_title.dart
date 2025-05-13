import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';

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
