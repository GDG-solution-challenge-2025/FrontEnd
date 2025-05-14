import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';

final defaultElavetionBtnStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  elevation: btnElevation,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        textFieldBorderRadius,
      ),
    ),
  ),
);
