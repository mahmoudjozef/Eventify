import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'AppColor.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColor.backGroundColorLight,),
    scaffoldBackgroundColor: AppColor.backGroundColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.inputsColorLight,
      selectedItemColor: AppColor.mainColorLight,
      unselectedItemColor: AppColor.disableColorLight,
    ),
    textTheme: TextTheme(
      titleSmall:  AppStyle.small16Black,
      titleMedium: AppStyle.bold20Black,
      titleLarge: AppStyle.bold24MainLight,
      labelSmall: AppStyle.small14secLight,
      labelMedium: AppStyle.medium18Black,
      bodySmall: AppStyle.small14mainLight,
      bodyMedium: AppStyle.medium18mainLight,

    ),
  );
  static final ThemeData darkMode = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColor.BGDarkMode,),

    scaffoldBackgroundColor: AppColor.BGDarkMode,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.BGDarkMode,
      selectedItemColor: AppColor.mainColorDark,
      unselectedItemColor: AppColor.disableColorDark,
    ),
    textTheme: TextTheme(
      titleSmall:  AppStyle.small16White,
      titleMedium: AppStyle.bold20White,
      titleLarge: AppStyle.bold24White,
      labelSmall: AppStyle.small14secDark,
      labelMedium: AppStyle.medium18White,
      bodySmall: AppStyle.small14mainDark,
      bodyMedium: AppStyle.medium18mainDark,


    ),
  );
}
