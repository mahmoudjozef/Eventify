import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipUi extends StatelessWidget {
  final String eventName;
  final bool isSelected;
  final VoidCallback onTap;

  ChipUi({
    super.key,
    required this.eventName,
    required this.isSelected,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),

        margin: EdgeInsets.symmetric(horizontal: 6),

        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: themeProvider.isLightMode()?AppColor.strokeColorLight:AppColor.strokeColorDark),

          color: themeProvider.isLightMode()
              ? isSelected
                    ? AppColor.mainColorLight
                    : Colors.white
              : isSelected
              ? AppColor.mainColorDark
              : AppColor.inputsColorDark,
        ),

        child: Text(
          eventName,
          style: TextStyle(
            color: themeProvider.isLightMode()
                ? isSelected
                      ? AppColor.whiteColor
                      : AppColor.mainColorLight
                : isSelected
                ? AppColor.whiteColor
                : AppColor.mainColorDark,
          ),
        ),
      ),
    );
  }
}
