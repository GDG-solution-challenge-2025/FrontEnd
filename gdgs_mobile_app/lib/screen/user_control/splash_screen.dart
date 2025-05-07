import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> autoLoginCheck() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print('splash');
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
              future: autoLoginCheck(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  final loginFlag = snapshot.data;
                  if (loginFlag != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        print('login Flag is $loginFlag');
                        if (loginFlag) {
                          print('go home');
                          context.goNamed(AppRoute.home);
                          print('done home');
                        } else {
                          print('go login');
                          context.goNamed(AppRoute.login);
                          print('done login');
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
