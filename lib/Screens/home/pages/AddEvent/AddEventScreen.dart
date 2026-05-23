import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/Screens/home/pages/AddEvent/widget/DateWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/ChipsWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> evetsName = [];

  List<String> eventsImagesLight = [
    AppAssets.sportLight,
    AppAssets.birthDayLight,
    AppAssets.meetingLight,
    AppAssets.bookClubLight,
    AppAssets.exhibitionLight,

  ];

  List<String> eventsImagesDark = [
    AppAssets.sportLight,
    AppAssets.birthDayLight,
    AppAssets.meetingLight,
    AppAssets.bookClubLight,
    AppAssets.exhibitionLight,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    evetsName = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.isLightMode()
              ? AppColor.mainColorLight
              : AppColor.mainColorDark,
        ),
        centerTitle: true,
        title: Text('Add Event', style: Theme.of(context).textTheme.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              themeProvider.isLightMode()
                  ? eventsImagesLight[selectedIndex]
                  : eventsImagesDark[selectedIndex],
            ),
            SizedBox(height: 10),
            ChipsWidget(
              eventName: evetsName,
              onTap: (index) {
              selectedIndex =index;
              setState(() {});
            },selectedIndex: selectedIndex,
            ),
            SizedBox(height: 10),
            Text('Title',style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(height: 10),
            TextFieldCustom(hintText: 'Title'),
            SizedBox(height: 10),
            Text('Description',style: Theme.of(context).textTheme.titleSmall,),
            TextFieldCustom(hintText: 'Description',maxLine: 5,),
            SizedBox(height: 10),
            DateWidget(),
          ],
        ),
      ),
    );
  }
}
