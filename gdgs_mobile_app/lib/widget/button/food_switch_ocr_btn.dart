import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';

enum FoodSwitchOcrState {
  food,
  ocr,
}

class FoodSwitchOcrBtn extends StatelessWidget {
  FoodSwitchOcrBtn({
    super.key,
    required this.state,
    this.onTap,
  });

  FoodSwitchOcrState state = FoodSwitchOcrState.food;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 30,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 210,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: toggleUnSelectBtnColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: state == FoodSwitchOcrState.food
                      ? toggleSelectBtnColor
                      : toggleUnSelectBtnColor,
                ),
                child: Center(
                  child: Text(
                    'Food',
                    style: TextStyle(
                      color: state == FoodSwitchOcrState.food
                          ? toggleSelectTextColor
                          : toggleUnSelectTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: state == FoodSwitchOcrState.ocr
                      ? toggleSelectBtnColor
                      : toggleUnSelectBtnColor,
                ),
                child: Center(
                  child: Text(
                    'OCR',
                    style: TextStyle(
                      color: state == FoodSwitchOcrState.ocr
                          ? toggleSelectTextColor
                          : toggleUnSelectTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
