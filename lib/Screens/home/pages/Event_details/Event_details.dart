import 'package:eventify/Screens/home/pages/Event_details/Widget/DateAndTime.dart';
import 'package:eventify/Screens/home/pages/Event_details/Widget/deleteButtom.dart';
import 'package:eventify/Screens/home/pages/Event_details/Widget/editButtom.dart';
import 'package:eventify/model/EventModel.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as EventModel;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.isLightMode()
              ? Colors.black
              : AppColor.mainColorLight,
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Event Details',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouts.routeNamedAddEventEditScreen,arguments: args
                );
              },

              child: EditButtom(),
            ),
            SizedBox(width: 10),
            InkWell(
                onTap: () {
                  FireBaseUtils.deleteEvent(args.id);
                  Navigator.pop(context);
                },
                child: DeleteButtom()),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(args.eventImage),
            Text(
              args.eventTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DateAndTime(data: args.eventDate, Time: args.eventTime),
            Text('Description', style: Theme.of(context).textTheme.titleSmall),
            Container(
              width: double.infinity,
              height: 179,
              decoration: BoxDecoration(
                color: themeProvider.isLightMode()
                    ? AppColor.whiteColor
                    : AppColor.inputsColorDark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  args.eventDescription,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
