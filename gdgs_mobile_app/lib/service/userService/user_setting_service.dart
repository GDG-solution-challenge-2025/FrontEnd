import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingService {
  static Future<void> userAutoLoginSet(
      BuildContext context, bool autoLoginState) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('autoLogin', autoLoginState);
  }

  static Future<bool> userAutoLoginGet(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('autoLogin') ?? false;
  }
}
