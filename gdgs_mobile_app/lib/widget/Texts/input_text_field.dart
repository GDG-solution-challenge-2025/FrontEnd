import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    super.key,
    required this.titleName,
    required this.hintText,
    required this.textController,
    this.onTextChange,
  });

  String titleName = 'Dish name';
  String hintText = 'required';
  TextEditingController textController;
  Function(String)? onTextChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: defaultLayoutContentMargin),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.bold,
                  ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onChanged: onTextChange,
          ),
        ],
      ),
    );
  }
}
