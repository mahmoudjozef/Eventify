import 'package:eventify/Screens/home/pages/homePage/widget/ChipsWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/LanguageButtonWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        'John Safwat',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      themeProvider.changeTheme(ThemeMode.dark);
                    },
                    icon: Icon(
                      themeProvider.isLightMode()
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_outlined,
                      color: themeProvider.isLightMode()
                          ? AppColor.mainColorLight
                          : AppColor.mainColorDark,
                    ),
                  ),
                  LanguageButtonWidget(),
                ],
              ),
              ChipsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
