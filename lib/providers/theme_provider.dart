import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.light;
  void changeTheme(ThemeMode newTheme){
    appTheme=newTheme;
    notifyListeners();
  }

  bool isLightMode() {
    return appTheme==ThemeMode.light;
  }
}