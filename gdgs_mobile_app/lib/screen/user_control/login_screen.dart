import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';
import 'package:gdgs_mobile_app/service/userService/user_login_service.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';
import 'package:gdgs_mobile_app/util/values/number_const.dart';
import 'package:gdgs_mobile_app/widget/Texts/title_text.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _idTextController = TextEditingController();
  final _pwTextController = TextEditingController();

  bool _pwTextShow = false;

  final String _idErrText = "";
  final String _pwErrText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultHorizontalMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: "Fooding",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: loginTextColor,
                    ),
              ),
              TitleText(
                text: 'An traveler marches on its stomach',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: loginTextColor,
                    ),
              ),
              const SizedBox(
                height: defaultLayoutDistance,
              ),
              TextField(
                controller: _idTextController,
                decoration: InputDecoration(
                  errorText: _idErrText == "" ? null : _idErrText,
                  enabledBorder: OutlineInputBorder(
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
                  hintText: 'ID',
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
                ),
                onSubmitted: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              TextField(
                  controller: _pwTextController,
                  obscureText: !_pwTextShow,
                  decoration: InputDecoration(
                    errorText: _pwErrText == "" ? null : _pwErrText,
                    enabledBorder: OutlineInputBorder(
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
                    hintText: 'Password',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
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
                  ),
                  onSubmitted: (value) {
                    setState(() {});
                  }),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    print("로그인 >> 시작");
                    print(
                        "로그인 >> id: ${_idTextController.text} // pw: ${_pwTextController.text}");
                    final userData = await UserLoginService.userLogin(
                      _idTextController.text,
                      _pwTextController.text,
                    );
                    if (userData != null) {
                      print("로그인 >> 유저 데이타 Get ${userData.toJson()}");
                      await TokenStorage().saveToken(userData.session!);
                      print("로그인 >> 유저 데이타 Get ${userData.toJson()}");
                      if (context.mounted) {
                        context.goNamed(
                          AppRoute.home,
                        );
                      }
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
                    'Login',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: btnTextColor,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: defaultLayoutContentMargin,
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      context.goNamed(AppRoute.signup);
                    },
                    child: Text(
                      'Create Account >',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: signupTextColor,
                          ),
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
