import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    super.key,
    this.prefixIcon,
    this.obscureText,
    this.suffix,
    this.maxLine,
    this.validator,
    this.onChanged,
    this.controller,
    required this.hintText,
  });

  IconData? prefixIcon;
  IconData? suffix;
  String hintText;
  TextEditingController? controller;
  bool? obscureText;
  int? maxLine;
  String? Function(String?)? validator;
  String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return TextFormField(
      style: TextStyle(
        color: themeProvider.isLightMode()
            ? AppColor.blackColor
            : AppColor.whiteColor,
      ),
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      maxLines: maxLine,
      decoration: InputDecoration(
        filled: true,
        fillColor: themeProvider.isLightMode()
            ? AppColor.whiteColor
            : AppColor.inputsColorDark,
        prefixIcon: Icon(
          prefixIcon,
          color: themeProvider.isLightMode()
              ? AppColor.disableColorLight
              : AppColor.disableColorDark,
        ),
        suffixIcon: Icon(
          suffix,
          color: themeProvider.isLightMode()
              ? AppColor.disableColorLight
              : AppColor.disableColorDark,
        ),
        hintText: hintText,

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
