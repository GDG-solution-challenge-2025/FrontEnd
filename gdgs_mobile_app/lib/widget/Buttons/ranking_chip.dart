import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';

enum RankingState {
  searched,
  liked,
}

class RankingChip extends StatelessWidget {
  RankingChip({
    super.key,
    required this.title,
    required this.selected,
    this.onTap,
  });

  String title = "Searched";
  RankingState selected = RankingState.searched;
  Function? onTap;

  bool isSelected() {
    if (selected == RankingState.searched) {
      return title == "Searched" ? true : false;
    } else {
      return title == "Liked" ? true : false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: isSelected(),
      onSelected: (value) {
        onTap != null ? onTap!() : null;
      },
      selectedColor: chipSelectColor,
      backgroundColor: chipUnSelectColor,
      showCheckmark: false,
      label: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: chipTextColor,
            ),
      ),
    );
  }
}
