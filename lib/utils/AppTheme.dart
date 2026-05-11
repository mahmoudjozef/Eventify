import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColor.backGroundColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.inputsColorLight,
      selectedItemColor: AppColor.mainColorLight,
      unselectedItemColor: AppColor.disableColorLight,
    ),
  );
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: AppColor.backGroundColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.mainColorDark,
      selectedItemColor: AppColor.mainColorDark,
      unselectedItemColor: AppColor.disableColorDark,
    ),
  );
}
