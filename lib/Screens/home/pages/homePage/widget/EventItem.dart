import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventItem({super.key});

  List<String> eventsImagesLight = [
    AppAssets.sportLight,
    AppAssets.birthDayLight,
    AppAssets.bookClubLight,
    AppAssets.exhibitionLight,
    AppAssets.meetingLight,
  ];
  List<String> eventsImagesDark = [
    AppAssets.sportDark,
    AppAssets.birthDayDark,
    AppAssets.bookClubDark,
    AppAssets.exhibitionDark,
    AppAssets.meetingDark,
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: BoxBorder.all(
                color: themeProvider.isLightMode()
                    ? AppColor.strokeColorLight
                    : AppColor.strokeColorDark,
              ),
              image: DecorationImage(image: AssetImage(AppAssets.sportLight)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 66,
                    height: 40,
                    decoration: BoxDecoration(
                      color: themeProvider.isLightMode()
                          ? AppColor.backGroundColorLight
                          : AppColor.inputsColorDark,
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        color: themeProvider.isLightMode()
                            ? AppColor.strokeColorLight
                            : AppColor.strokeColorDark,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text('12 jun', textAlign: TextAlign.center),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: themeProvider.isLightMode()
                          ? AppColor.backGroundColorLight
                          : AppColor.inputsColorDark,
                      borderRadius: BorderRadius.circular(8),
                      border: BoxBorder.all(
                        color: themeProvider.isLightMode()
                            ? AppColor.strokeColorLight
                            : AppColor.strokeColorDark,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'This is a Birthday Party ',
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.favorite,color: themeProvider.isLightMode()?AppColor.mainColorLight:AppColor.mainColorDark,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 5,
      ),
    );
  }
}
