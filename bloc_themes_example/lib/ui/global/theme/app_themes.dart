import 'package:flutter/material.dart';

enum AppTheme {
  PurpleLight,
  PurpleDark,
  OrangeLight,
  OrangeDark,
}

final appThemeData = {
  AppTheme.PurpleLight:
      ThemeData(
        brightness: Brightness.light, 
        primaryColor: Colors.purple
        ),
  AppTheme.PurpleDark:
      ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.purple[700]
        ),
  AppTheme.OrangeLight:
      ThemeData(
        brightness: Brightness.light,
         primaryColor: Colors.orange
         ),
  AppTheme.OrangeDark:
      ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.orange[700]
        ),
};
