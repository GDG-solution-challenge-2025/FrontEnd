import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/input_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameTextController = TextEditingController();

  final _idTextController = TextEditingController();

  final _pwTextController = TextEditingController();

  final _conPwTextController = TextEditingController();

  bool isNameEmptyCheck() => _nameTextController.text != "";
  bool isIDEmptyCheck() => _idTextController.text != "";
  bool isPwEmptyCheck() => _pwTextController.text != "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: titleTextColor),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultHorizontalMarginValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              InputTextField(
                titleName: 'Name',
                hintText: 'Name',
                textController: _nameTextController,
                onTextChange: (text) {
                  setState(() {
                    _nameTextController.text = text;
                  });
                },
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isNameEmptyCheck() ? 1.0 : 0.0,
                child: InputTextField(
                  titleName: 'ID',
                  hintText: 'ID',
                  textController: _idTextController,
                  onTextChange: (text) {
                    setState(() {
                      _idTextController.text = text;
                    });
                  },
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isNameEmptyCheck() && isIDEmptyCheck() ? 1.0 : 0.0,
                child: InputTextField(
                  titleName: 'Password',
                  hintText: 'Password',
                  textController: _pwTextController,
                  onTextChange: (text) {
                    setState(() {
                      _pwTextController.text = text;
                    });
                  },
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isNameEmptyCheck() && isIDEmptyCheck() ? 1.0 : 0.0,
                child: InputTextField(
                  titleName: 'Confirm Password',
                  hintText: 'Confirm Password',
                  textController: _conPwTextController,
                  onTextChange: (text) {
                    setState(() {
                      _conPwTextController.text = text;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    elevation: 4.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          6.0,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: btnTextColor,
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
