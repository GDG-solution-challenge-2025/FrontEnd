import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';

class InputTextField extends StatelessWidget {
  InputTextField({
    super.key,
    required this.titleName,
    required this.hintText,
    required this.textController,
    this.errorMsg,
    this.helperMsg,
    this.obscureText,
    this.suffixIcon,
    this.helperBorder,
    this.validator,
    this.onSubmitted,
    this.onChanged,
  });

  String titleName = 'Dish name';
  String hintText = 'required';
  TextEditingController textController;
  String? errorMsg;
  String? helperMsg;
  bool? obscureText;
  Widget? suffixIcon;
  OutlineInputBorder? helperBorder;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  String? Function(String?)? validator;

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
          TextFormField(
            controller: textController,
            validator: validator,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              enabledBorder: helperMsg != null
                  ? helperBorder
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: textFieldBorderWidth,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          textFieldBorderRadius,
                        ),
                      ),
                    ),
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.bold,
                  ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: textFieldBorderWidth,
                  style: BorderStyle.solid,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorTextColor,
                  width: textFieldBorderWidth,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: hintText,
              helperText: helperMsg,
              helperStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.lightGreen,
                  ),
              errorText: errorMsg,
              errorStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: errorTextColor,
                  ),
            ),
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
          ),
        ],
      ),
    );
  }
}
