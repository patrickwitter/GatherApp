import 'package:flutter/material.dart';
import 'package:upc_app/theme/lightThemeDetails.dart' as lightTheme;
import 'package:upc_app/theme/darktheme_details.dart' as darkTheme;

ThemeData appLightTheme = ThemeData.light().copyWith(
  textTheme: lightTheme.lightTextTheme,
  colorScheme: lightTheme.lightColorScheme,
  iconTheme: lightTheme.lightIcontheme,
  scaffoldBackgroundColor: lightTheme.scaffoldBackground,
  appBarTheme: lightTheme.appBarTheme,
  cardColor: lightTheme.cardColor,
);

ThemeData appDarkTheme = ThemeData.dark().copyWith(
  textTheme: darkTheme.darkTextTheme,
  colorScheme: darkTheme.darkColorScheme,
  iconTheme: darkTheme.darkIcontheme,
  scaffoldBackgroundColor: darkTheme.scaffoldBackground,
  appBarTheme: darkTheme.appBarTheme,
  cardColor: darkTheme.cardColor,
);
