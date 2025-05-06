import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({
    super.key,
    this.text = "",
    this.style,
  });

  String text = "";
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
    );
  }
}
