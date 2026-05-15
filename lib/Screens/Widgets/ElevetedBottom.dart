import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElevatedButtonCustom extends StatelessWidget {
   ElevatedButtonCustom({super.key,required this.onPressed,required this.text});
   VoidCallback onPressed;
   String text;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeProvider.isLightMode()
              ? AppColor.mainColorLight
              : AppColor.mainColorDark,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyle.bold20White,
        ),
      ),
    );
  }
}
