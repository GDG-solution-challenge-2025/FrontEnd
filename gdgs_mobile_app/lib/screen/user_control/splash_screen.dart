import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool autoLogin = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.goNamed(AppRoute.home);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text('Loading...'),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.home);
              },
              child: const Text(
                'Go to Home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
