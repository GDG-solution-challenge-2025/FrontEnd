import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/router.dart';
import 'package:gdgs_mobile_app/util/theme/color_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
