import 'package:eventify/Screens/home/pages/homePage/widget/ChipsWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/EventItem.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/LanguageButtonWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
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
            spacing: 10,
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
                      if(themeProvider.appTheme==ThemeMode.light){
                        themeProvider.changeTheme(ThemeMode.dark);
                      }else{
                        themeProvider.changeTheme(ThemeMode.light);
                      }

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
              ChipsWidget(
                eventName: evetsName,
                selectedIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FireBaseUtils.getEventsStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData||snapshot.data!.docs.isEmpty) {
                      return Center(child:Text('no data'));
                    }
                    var events = snapshot.data!.docs.map((e) {
                      return e.data();
                    }).toList();
                    if(selectedIndex!=0){
                      events=events.where((element) => element.eventName==evetsName[selectedIndex]).toList();
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouts.routeNamedAddEventDetailsScreen,arguments: events[index]);
                            },child: EventItem(event: events[index]));
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: events.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
