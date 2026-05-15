import 'package:flutter/material.dart';

import 'AppColor.dart';

class AppStyle {
  // styles light theme
  static const TextStyle bold20Black =  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.blackColor,
  );
  static const TextStyle bold24MainLight =  TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.mainColorLight,
  );
  static const TextStyle small16Black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );
  static const TextStyle small14secLight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.secTextColorLight,
  );
  static const TextStyle small14mainLight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.mainColorLight,
  );
  static const TextStyle medium18mainLight = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.mainColorLight,
  );
  static const TextStyle medium18Black = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );
  static const TextStyle bold14gray =   TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.secTextColorLight,
  );
  // styles dark theme
  static const TextStyle bold20White =   TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
  );
  static const TextStyle bold24White=  TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
  );
  static const TextStyle small14secDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.secTextColorDark,
  );
  static const TextStyle small14mainDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.mainColorDark,
  );
  static const TextStyle medium18mainDark = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.mainColorLight,
  );
  static const TextStyle small16White =  TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
  static const TextStyle medium18White = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteColor,
  );
}