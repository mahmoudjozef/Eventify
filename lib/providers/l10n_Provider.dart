import 'package:flutter/material.dart';

class L10nProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  void changeLanguage(String newLanguage) {
    if (newLanguage == currentLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    notifyListeners();
  }
  bool isEnglish(){
    return currentLanguage=='en';
  }
  bool isArabic(){
   return currentLanguage=='ar';
  }
}
