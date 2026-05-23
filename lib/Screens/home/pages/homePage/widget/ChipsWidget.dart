import 'package:eventify/Screens/home/pages/homePage/widget/TabBarItem.dart';
import 'package:flutter/material.dart';

class ChipsWidget extends StatefulWidget {
 final List<String>eventName;
 final void Function(int)? onTap;
 int selectedIndex = 0;
  ChipsWidget({super.key,required this.eventName, this.onTap,required this.selectedIndex});

  @override
  State<ChipsWidget> createState() => _ChipsWidgetState();
}

class _ChipsWidgetState extends State<ChipsWidget> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.eventName.length,
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 2),
        onTap: widget.onTap,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: widget.eventName.map((e) {
          return TabBarItem(
            isSelected: widget.selectedIndex == widget.eventName.indexOf(e),
            text: e,
          );
        }).toList(),
      ),
    );
  }
}

