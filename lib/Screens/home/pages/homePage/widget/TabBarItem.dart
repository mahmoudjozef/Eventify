import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TabBarItem extends StatelessWidget {
  TabBarItem({super.key, required this.isSelected, required this.text});

  bool isSelected;
  String text;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? themeProvider.isLightMode()
            ? AppColor.mainColorLight
            : AppColor.mainColorDark
            : themeProvider.isLightMode()
            ? AppColor.whiteColor
            : AppColor.inputsColorDark,
      ),
      child: Text(
        text,
        style: AppStyle.bold24White.copyWith(
          fontSize: 16,
          color: isSelected
              ? themeProvider.isLightMode()
              ? AppColor.whiteColor
              : AppColor.whiteColor
              : themeProvider.isLightMode()
              ? AppColor.blackColor
              : AppColor.whiteColor,
        ),
      ),
    );
  }
}
