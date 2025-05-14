import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:go_router/go_router.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Setting Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text("auto Login setting"),
              onTap: () {
                context.goNamed(AppRoute.settingAutoLogin);
              },
            ),
            ListTile(
              title: const Text("food restriction"),
              onTap: () {
                context.goNamed(AppRoute.settingfoodRestrictionSelect);
              },
            ),
          ],
        ),
      ),
    );
  }
}
