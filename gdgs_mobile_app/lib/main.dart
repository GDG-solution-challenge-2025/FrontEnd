import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/router.dart';
import 'package:gdgs_mobile_app/util/theme/theme.dart';

Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        overscroll: false,
      ),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
