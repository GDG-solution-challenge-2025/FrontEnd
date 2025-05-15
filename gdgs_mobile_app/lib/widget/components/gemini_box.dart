import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';

class GeminiBox extends StatelessWidget {
  const GeminiBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("build Gemini Box");
    return Container(
      width: 280,
      height: 160,
      decoration: BoxDecoration(
        color: boxBackgroundColor,
        borderRadius: BorderRadius.circular(
          containerBoxBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: containerBoxBorderRadius,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          geminiImagePath,
          width: 146,
          height: 100,
        ),
      ),
    );
  }
}
