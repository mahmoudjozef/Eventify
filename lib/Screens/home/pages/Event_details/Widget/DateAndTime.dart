import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateAndTime extends StatelessWidget {
  DateAndTime({super.key, required this.data, required this.Time});

  DateTime data;
  String Time;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: double.infinity,
      height: 73,
      decoration: BoxDecoration(
        color: themeProvider.isLightMode()
            ? AppColor.whiteColor
            : AppColor.inputsColorDark,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: themeProvider.isLightMode()
              ? AppColor.inputsColorLight
              : AppColor.inputsColorDark,
        ),
      ),
      child: Row(
        spacing: 15,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: themeProvider.isLightMode()
                    ? AppColor.backGroundColorLight
                    : AppColor.inputsColorDark,
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(
                  color: themeProvider.isLightMode()
                      ? AppColor.inputsColorLight
                      : AppColor.inputsColorDark,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.calendar_month,
                  color: themeProvider.isLightMode()
                      ? AppColor.mainColorLight
                      : AppColor.mainColorDark,
                ),
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('MMM d').format(data),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(Time, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
