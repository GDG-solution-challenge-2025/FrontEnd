import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/user_model.dart';
import 'package:gdgs_mobile_app/service/userService/user_login_service.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/input_text_field.dart';
import 'package:go_router/go_router.dart';

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

  bool _pwTextShow = false;
  bool _conPwTextShow = false;

  bool isNameEmptyCheck() => _nameTextController.text != "";
  bool isIDEmptyCheck() => _idTextController.text != "";
  bool isPwEmptyCheck() => _pwTextController.text != "";
  bool isPwCheck() => _pwTextController.text == _conPwTextController.text;

  bool allReadyOk() {
    return isNameEmptyCheck() &&
        isIDEmptyCheck() &&
        isPwEmptyCheck() &&
        isPwCheck() &&
        _pwCheckText != null &&
        _conPwCheckText != null;
  }

  String? _idErrText;
  String? _idCheckText;
  String? _nameErrText;
  String? _pwErrText;
  String? _conPwErrText;
  String? _pwCheckText;
  String? _conPwCheckText;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (value.length > 50) {
      return 'Password must be 50 characters long or less.';
    }

    final RegExp lowercaseRegex = RegExp(r'[a-z]');
    if (!lowercaseRegex.hasMatch(value)) {
      return 'Password must contain lowercase letters.';
    }

    final RegExp uppercaseRegex = RegExp(r'[A-Z]');
    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain uppercase letters.';
    }

    final RegExp digitRegex = RegExp(r'[0-9]');
    if (!digitRegex.hasMatch(value)) {
      return 'Password must contain numbers.';
    }

    final RegExp specialCharRegex = RegExp(r'[!@#%^&*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain special characters (!,@,#,\\,\$,%,^,&,*).';
    }

    return null;
  }

  void _checkPasswordStrength(String value) {
    final error = _validatePassword(value);
    setState(() {
      if (value.isEmpty) {
        _pwErrText = null;
      } else if (error == null) {
        _pwErrText = null;
        _pwCheckText = 'This is an available password.';
      } else {
        _pwErrText = error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: titleTextColor),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultHorizontalMargin),
          child: SingleChildScrollView(
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
                  errorMsg: _nameErrText,
                  onSubmitted: (text) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: defaultLayoutContentMargin,
                ),
                AnimatedOpacity(
                  duration: const Duration(
                    milliseconds: textFieldAnimationMlisec,
                  ),
                  opacity: isNameEmptyCheck() ? 1.0 : 0.0,
                  child: InputTextField(
                    titleName: 'ID',
                    hintText: 'ID',
                    textController: _idTextController,
                    errorMsg: _idErrText,
                    helperMsg: _idCheckText,
                    suffixIcon: _idCheckText != null
                        ? const Icon(
                            Icons.check,
                            size: 24,
                            color: Colors.lightGreen,
                          )
                        : null,
                    helperBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        textFieldBorderWidth,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.lightGreen,
                        style: BorderStyle.solid,
                        width: textFieldBorderWidth,
                      ),
                    ),
                    onSubmitted: (text) async {
                      if (_idTextController.text.isNotEmpty) {
                        final check = await UserLoginService.userIdCheck(
                            _idTextController.text);
                        setState(() {
                          if (check != null && check) {
                            _idCheckText = "The ID is not duplicated.";
                            _idErrText = null;
                          } else {
                            _idCheckText = null;
                            _idErrText = "There is a duplicate ID.";
                          }
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: defaultLayoutContentMargin,
                ),
                AnimatedOpacity(
                  duration: const Duration(
                    milliseconds: textFieldAnimationMlisec,
                  ),
                  opacity: isNameEmptyCheck() && isIDEmptyCheck() ? 1.0 : 0.0,
                  child: InputTextField(
                    titleName: 'Password',
                    hintText: 'Password',
                    textController: _pwTextController,
                    errorMsg: _pwErrText,
                    obscureText: !_pwTextShow,
                    helperMsg: _pwCheckText,
                    helperBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        textFieldBorderWidth,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.lightGreen,
                        style: BorderStyle.solid,
                        width: textFieldBorderWidth,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _pwTextShow ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _pwTextShow = !_pwTextShow;
                        });
                      },
                    ),
                    validator: _validatePassword,
                    onChanged: _checkPasswordStrength,
                  ),
                ),
                const SizedBox(
                  height: defaultLayoutContentMargin,
                ),
                AnimatedOpacity(
                  duration: const Duration(
                    milliseconds: textFieldAnimationMlisec,
                  ),
                  opacity: isNameEmptyCheck() && isIDEmptyCheck() ? 1.0 : 0.0,
                  child: InputTextField(
                    titleName: 'Confirm Password',
                    hintText: 'Confirm Password',
                    textController: _conPwTextController,
                    obscureText: !_conPwTextShow,
                    errorMsg: _conPwErrText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _conPwTextShow
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _conPwTextShow = !_conPwTextShow;
                        });
                      },
                    ),
                    helperMsg: _conPwCheckText,
                    helperBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        textFieldBorderWidth,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.lightGreen,
                        style: BorderStyle.solid,
                        width: textFieldBorderWidth,
                      ),
                    ),
                    onSubmitted: (text) {
                      if (isPwCheck()) {
                        setState(() {
                          _conPwCheckText = "Passwords match";
                          _conPwErrText = null;
                        });
                      } else {
                        setState(() {
                          _conPwErrText = "The password is different.";
                          _conPwCheckText = null;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: defaultLayoutContentMargin,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (allReadyOk()) {
                        UserModel user = UserModel(
                          id: _idTextController.text,
                          name: _nameTextController.text,
                          pw: _pwTextController.text,
                          lang: Language.english,
                        );
                        print("회원가입 >> ${user.toSignupJson()}");
                        var success = await UserLoginService.userSignup(user);
                        print("회원가입 >> $success");
                        context.goNamed(AppRoute.foodRestrictionSelect);
                      } else {
                        print("회원가입 >> 준비가 안됨");
                        print("회원가입 >> ${isNameEmptyCheck()}");
                        print("회원가입 >> ${isIDEmptyCheck()}");
                        print("회원가입 >> ${isPwEmptyCheck()}");
                        print("회원가입 >> ${isPwCheck()}");
                        print("회원가입 >> ${_pwCheckText != null}");
                        print("회원가입 >> ${_conPwCheckText != null}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: btnElevation,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            textFieldBorderRadius,
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
      ),
    );
  }
}
