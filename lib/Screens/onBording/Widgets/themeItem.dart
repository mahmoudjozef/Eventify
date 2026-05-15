import 'package:flutter/material.dart';

import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:provider/provider.dart';

class ThemeItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final VoidCallback onTap;

  const ThemeItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 83,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? themeProvider.isLightMode()
                    ? AppColor.mainColorLight
                    : AppColor.mainColorDark
              : themeProvider.isLightMode()
              ? AppColor.whiteColor
              : AppColor.inputsColorDark,
        ),
        child: Icon(
         icon ,
          color: isSelected
              ? themeProvider.isLightMode()
                    ? AppColor.whiteColor
                    : AppColor.whiteColor
              : themeProvider.isLightMode()
              ? AppColor.mainColorLight
              : AppColor.whiteColor,
        ),
      ),
    );
  }
}
