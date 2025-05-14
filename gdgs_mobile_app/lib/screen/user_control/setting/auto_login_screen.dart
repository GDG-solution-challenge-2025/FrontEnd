import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/service/userService/user_setting_service.dart';
import 'package:gdgs_mobile_app/util/values/layout_const.dart';

class AutoLoginScreen extends StatefulWidget {
  const AutoLoginScreen({super.key});

  @override
  State<AutoLoginScreen> createState() => _AutoLoginScreenState();
}

class _AutoLoginScreenState extends State<AutoLoginScreen> {
  bool _autoLoginValue = false;

  Future<void> autoLoginCheck(BuildContext context) async {
    _autoLoginValue = await UserSettingService.userAutoLoginGet(context);
  }

  Future<void> autoLoginValueSet(BuildContext context, bool value) async {
    await UserSettingService.userAutoLoginSet(context, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: defaultTopMarginValue,
        ),
        child: Row(
          children: [
            const Text(
              "Auto Login State",
            ),
            FutureBuilder(
              future: autoLoginCheck(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Switch(
                    value: false,
                    onChanged: (value) {
                      print("Switch waiting");
                    },
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Switch(
                    value: _autoLoginValue,
                    onChanged: (value) async {
                      await autoLoginValueSet(context, value);
                      setState(() {
                        _autoLoginValue = value;
                      });
                    },
                  );
                } else {
                  return Switch(
                    value: false,
                    onChanged: (value) {
                      print("Switch error");
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
