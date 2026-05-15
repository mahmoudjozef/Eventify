import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleWidget extends StatelessWidget {
  const GoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.isLightMode()?AppColor.whiteColor:AppColor.inputsColorDark,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: themeProvider.isLightMode()
              ? AppColor.strokeColorLight
              : AppColor.strokeColorDark,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 92),
        child: Row(
          children: [
            Image.asset(AppAssets.googleIcon),
            SizedBox(width: 10),
            Text('Sign up with Google',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}
