import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/widget/Texts/text_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText(
              text: "Fooding",
            ),
          ],
        ),
      ),
    );
  }
}
