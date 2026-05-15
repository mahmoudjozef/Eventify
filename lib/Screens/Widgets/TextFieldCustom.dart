import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({super.key, this.prefixIcon, this.suffix, required this.hintText});
IconData? prefixIcon;
IconData? suffix;
String hintText;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: themeProvider.isLightMode()
            ? AppColor.whiteColor
            : AppColor.inputsColorDark,
        prefixIcon: Icon(prefixIcon,color: themeProvider.isLightMode()?AppColor.disableColorLight:AppColor.disableColorDark),
        suffixIcon: Icon(suffix,color: themeProvider.isLightMode()?AppColor.disableColorLight:AppColor.disableColorDark),
        hint: Text(hintText),
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: buildBorder(themeProvider),
        focusedBorder: buildBorder(themeProvider),
        enabledBorder: buildBorder(themeProvider),
      ),
    );
  }

  OutlineInputBorder buildBorder(ThemeProvider themeProvider) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: themeProvider.isLightMode()
            ? AppColor.strokeColorLight
            : AppColor.strokeColorDark,
      ),
    );
  }
}
