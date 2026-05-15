import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/theme_provider.dart';
import '../../../../../utils/AppStyle.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var providerTheme = Provider.of<ThemeProvider>(context);
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: providerTheme.isLightMode()?AppColor.inputsColorLight:AppColor.inputsColorDark,
        borderRadius: BorderRadius.circular(16),border: BoxBorder.all(color: providerTheme.isLightMode()?AppColor.strokeColorLight:AppColor.strokeColorDark),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * (16 / 375),
        ),
        child: Row(
          children: [
            Text(AppLocalizations.of(context)!.darkMode, style: AppStyle.medium18Black.copyWith(
              color: providerTheme.isLightMode()
                  ? AppColor.mainTextColorLight
                  : AppColor.mainTextColorDark,
            ),),
            Spacer(),
            Switch(
              activeTrackColor: AppColor.mainColorDark,
              value: !providerTheme.isLightMode(),
              onChanged: (newTheme) {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).changeTheme(newTheme ? ThemeMode.dark : ThemeMode.light);
              },
            ),

      ],
        ),
      ),
    );
  }
}
