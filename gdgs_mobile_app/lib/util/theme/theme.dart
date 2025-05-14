import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/theme/color_theme.dart';
import 'package:gdgs_mobile_app/util/theme/font_theme.dart';
import 'package:gdgs_mobile_app/util/values/color_const.dart';
import 'package:gdgs_mobile_app/util/values/str_const.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: textTheme,
  fontFamily: fontPretendard,
  useMaterial3: true,
);
