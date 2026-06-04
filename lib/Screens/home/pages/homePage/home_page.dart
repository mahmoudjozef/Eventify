import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/ChipsUi.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/EventItem.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/LanguageButtonWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> evetsName = [];
  int selectedIndex = 0;
  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      evetsName = [
    AppLocalizations.of(context)!.all,
    AppLocalizations.of(context)!.sport,
    AppLocalizations.of(context)!.birthday,
    AppLocalizations.of(context)!.meeting,
    AppLocalizations.of(context)!.workShop,
    AppLocalizations.of(context)!.bookClub,
    AppLocalizations.of(context)!.exhibition,

  ];
      isFirstTime = false;
    }

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
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ).animate(delay: 1000.ms).fade(duration: 500.ms),
                      //nameAnimation
                      DefaultTextStyle(
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!,
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TyperAnimatedText(
                              FirebaseAuth.instance.currentUser?.displayName ??
                                  "",
                              speed: Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if (themeProvider.appTheme == ThemeMode.light) {
                        themeProvider.changeTheme(ThemeMode.dark);
                      } else {
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
              SizedBox(
                height: 50,
                child: ReorderableListView.builder(
                  scrollDirection: Axis.horizontal,
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) {
                      newIndex--;
                    }
                    setState(() {

                      final item = evetsName.removeAt(oldIndex);

                      evetsName.insert(newIndex, item);

                    });

                  },

                  itemCount: evetsName.length,

                  itemBuilder: (context, index) {

                    return SizedBox(

                      key: ValueKey(evetsName[index]),

                      child: ChipUi(

                        eventName: evetsName[index],

                        isSelected: selectedIndex == index,

                        onTap: () {

                          selectedIndex = index;

                          setState(() {});

                        },

                      ),

                    );

                  },

                ),
              ),
              // SizedBox(
              //   height: 50,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return ChipUi(
              //         eventName: evetsName[index],
              //         isSelected: selectedIndex == index,
              //         onTap: () {
              //           selectedIndex = index;
              //           setState(() {});
              //         },
              //       );
              //     },
              //     itemCount: evetsName.length,
              //   ),
              // ),
              Expanded(
                child: StreamBuilder(
                  stream: FireBaseUtils.getEventsStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('no data'));
                    }
                    var events = snapshot.data!.docs.map((e) {
                      return e.data();
                    }).toList();
                    if (selectedIndex != 0) {
                      events = events
                          .where(
                            (element) =>
                        element.eventName == evetsName[selectedIndex],
                      )
                          .toList();
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRouts.routeNamedAddEventDetailsScreen,
                              arguments: events[index],
                            );
                          },
                          child: EventItem(event: events[index])
                              .animate(
                            delay: Duration(milliseconds: 150 * index),
                          )
                              .fadeIn(duration: 400.ms)
                              .slideY(
                            begin: 0.2,
                            end: 0,
                            duration: 400.ms,
                            curve: Curves.easeOut,
                          ),
                        );
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
