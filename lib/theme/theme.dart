import 'package:flutter/material.dart';
import 'package:upc_app/theme/lightThemeDetails.dart';

ThemeData appLightTheme = ThemeData.light().copyWith(
    textTheme: lightTextTheme,
    colorScheme: ColorScheme.light().copyWith(
      secondary: Colors.grey,
    ),
    iconTheme: IconThemeData(color: Colors.blue));

ThemeData appDarkTheme = ThemeData.dark();
