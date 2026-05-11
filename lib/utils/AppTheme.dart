import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColor.backGroundColorLight,
  );
  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: AppColor.backGroundColorDark,
  );
}
