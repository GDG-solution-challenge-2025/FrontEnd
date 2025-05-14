import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/service/token_storage.dart';
import 'package:gdgs_mobile_app/service/userService/user_setting_service.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> autoLoginCheck(BuildContext context) async {
    final token = await TokenStorage().getToken();
    if (token != null) {
      if (context.mounted) {
        final autoLoginSetting =
            await UserSettingService.userAutoLoginGet(context);
        return autoLoginSetting;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoImagePath,
              width: 240,
              height: 240,
            ),
            FutureBuilder(
              future: autoLoginCheck(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  final loginFlag = snapshot.data;
                  if (loginFlag != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        if (loginFlag) {
                          context.goNamed(AppRoute.home);
                        } else {
                          context.goNamed(AppRoute.login);
                        }
                      }
                    });
                  }
                }
                return const Text('done');
              },
            ),
          ],
        ),
      ),
    );
  }
}
