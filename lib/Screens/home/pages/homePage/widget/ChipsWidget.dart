import 'package:chips_choice/chips_choice.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/TabBarItem.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipsWidget extends StatefulWidget {
  ChipsWidget({super.key});

  @override
  State<ChipsWidget> createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {
  int selectedIndex = 0;
  List<String> evetsName = [
    'all',
    'sport',
    'birthday',
    'meeting',
    'gaming',
    'workShop',
    'bookClub',
    'exhibition',
  ];

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: evetsName.length,
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 2),

        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        tabAlignment: TabAlignment.start,

        isScrollable: true,
        tabs: evetsName
            .map(
              (event) => TabBarItem(isSelected: selectedIndex == evetsName.indexOf(event),
                text: event,),
        )
            .toList(),
      ),
    );
  }
}
