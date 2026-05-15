import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);

    Color dividerColor = themeProvider.isLightMode()
        ? AppColor.strokeColorLight
        : AppColor.strokeColorDark;

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            color: dividerColor,
          ),
        ),
         SizedBox(width: 8),
        Text(
          AppLocalizations.of(context)!.or,
          style: TextStyle(color: themeProvider.isLightMode()?AppColor.mainColorLight:AppColor.mainColorDark),
        ),
         SizedBox(width: 8),
        Expanded(
          child: Divider(
            thickness: 2,
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}