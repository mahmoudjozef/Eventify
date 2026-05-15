import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageItem({
    super.key,
    required this.text,
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
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? themeProvider.isLightMode()
                        ? AppColor.whiteColor
                        : AppColor.whiteColor
                  : themeProvider.isLightMode()
                  ? AppColor.mainColorLight
                  : AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
