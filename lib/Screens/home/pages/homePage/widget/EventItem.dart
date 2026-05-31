import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/model/EventModel.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final EventModel event;

  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: themeProvider.isLightMode()
              ? AppColor.strokeColorLight
              : AppColor.strokeColorDark,
        ),
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isLightMode()
                ? event.eventImage
                : event.eventImageDark,
          ),
        ),
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeProvider.isLightMode()
                    ? AppColor.backGroundColorLight
                    : AppColor.inputsColorDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: themeProvider.isLightMode()
                      ? AppColor.strokeColorLight
                      : AppColor.strokeColorDark,
                ),
              ),
              child: Text(
                DateFormat('dd MMM').format(event.eventDate),style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
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
                border: Border.all(
                  color: themeProvider.isLightMode()
                      ? AppColor.strokeColorLight
                      : AppColor.strokeColorDark,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(event.eventTitle, textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall,),

                    IconButton(
                      onPressed: () {
                        event.isFavorite = !event.isFavorite;

                        FireBaseUtils.updateEvent(event);
                      },
                      icon: Icon(
                        event.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: themeProvider.isLightMode()
                            ? AppColor.mainColorLight
                            : AppColor.mainColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
