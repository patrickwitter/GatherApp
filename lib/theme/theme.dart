import 'package:flutter/material.dart';
import 'package:upc_app/theme/lightThemeDetails.dart' as lightTheme;

ThemeData appLightTheme = ThemeData.light().copyWith(
  textTheme: lightTheme.lightTextTheme,
  colorScheme: lightTheme.lightColorScheme,
  iconTheme: lightTheme.lightIcontheme,
  scaffoldBackgroundColor: lightTheme.scaffoldBackground,
  appBarTheme: lightTheme.appBarTheme,
  cardColor: lightTheme.textbuttonColor,
);

ThemeData appDarkTheme = ThemeData.dark();
