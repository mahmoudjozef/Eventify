import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditButtom extends StatelessWidget {
  const EditButtom({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 32,height: 32,
      decoration: BoxDecoration(
        color: themeProvider.isLightMode()
            ? AppColor.whiteColor
            : AppColor.inputsColorDark,
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(
          color: themeProvider.isLightMode()
              ? AppColor.inputsColorLight
              : AppColor.inputsColorDark,
        ),
      ),
      child:  Center(
        child: Icon(
            Icons.edit,
            color:themeProvider.isLightMode()
                ? AppColor.mainColorLight
                : AppColor.mainColorDark,
        ),
      ),

    );
  }
}
