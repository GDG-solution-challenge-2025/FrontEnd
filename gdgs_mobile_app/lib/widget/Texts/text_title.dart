import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({
    super.key,
    this.text = "",
  });

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold),
    );
  }
}
