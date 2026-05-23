import 'package:eventify/Screens/home/pages/homePage/widget/ChipsWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/EventItem.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/LanguageButtonWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<String> evetsName = [];

int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    evetsName = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
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
              SizedBox(height: 10),
              ChipsWidget(
                  eventName: evetsName,
                selectedIndex: selectedIndex,
                 onTap: (index) {
                   selectedIndex = index;
                   setState(() {

                   });
                 },
              ),
              EventItem()
            ],
          ),
        ),
      ),
    );
  }
}
