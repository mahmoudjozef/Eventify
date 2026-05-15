import 'package:eventify/Screens/onBording/Widgets/themeItem.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeWidgetOnBoarding extends StatelessWidget {
  const ThemeWidgetOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Spacer(),
        ThemeItem(icon: Icons.sunny, isSelected: themeProvider.appTheme==ThemeMode.light, onTap: () {
          Provider.of<ThemeProvider>(context,listen: false).changeTheme(ThemeMode.light);

        },),
        SizedBox(width: 14,),
        ThemeItem(icon: Icons.nightlight_outlined, isSelected:  themeProvider.appTheme==ThemeMode.dark, onTap: () {
          Provider.of<ThemeProvider>(context,listen: false).changeTheme(ThemeMode.dark);

        },),


      ],
    );
  }
}
