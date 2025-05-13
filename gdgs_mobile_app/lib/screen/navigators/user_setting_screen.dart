import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/service/userService/user_setting_service.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Setting Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the User Setting Screen!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final autoLoginData =
              await UserSettingService.userAutoLoginGet(context);
          if (!autoLoginData) {
            if(context.mounted){
              UserSettingService.userAutoLoginSet(context, true);
            }
          }
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
