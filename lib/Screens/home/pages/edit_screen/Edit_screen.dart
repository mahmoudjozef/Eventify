import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/Screens/home/pages/AddEvent/widget/DateWidget.dart';
import 'package:eventify/Screens/home/pages/AddEvent/widget/TimeWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/ChipsWidget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/model/EventModel.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  int selectedIndex = 0;
  List<String> eventName = [];
  List<String> eventsImagesLight = [
    AppAssets.sportLight,
    AppAssets.birthDayLight,
    AppAssets.meetingLight,
    AppAssets.bookClubLight,
    AppAssets.exhibitionLight,
  ];

  List<String> eventsImagesDark = [
    AppAssets.sportDark,
    AppAssets.birthDayDark,
    AppAssets.meetingDark,
    AppAssets.bookClubDark,
    AppAssets.exhibitionDark,
  ];
  //Date
  DateTime? dateTime;
  String? formatDate;

  TimeOfDay? choosedTime;
  String? formatTime;

  //DATA
  String? eventTitle;
  String? eventDescription;

  String eventImage = '';
  String eventImageDark = '';
  String selectedEventName = '';

  late EventModel args;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    eventName = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];

    args = ModalRoute.of(context)!.settings.arguments as EventModel;

    if (selectedIndex == 0) {
      selectedIndex = eventName.indexOf(args.eventName);
    }

    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Event',
          style: Theme.of(context).textTheme.titleSmall,
        ),

        centerTitle: true,

        iconTheme: IconThemeData(
          color: theme.isLightMode()
              ? AppColor.blackColor
              : AppColor.whiteColor,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),

        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              spacing: 10,

              children: [
                Image.asset(
                  theme.isLightMode() ? args.eventImage : args.eventImageDark,
                ),

                ChipsWidget(
                  eventName: eventName,

                  selectedIndex: selectedIndex,

                  onTap: (index) {
                    selectedIndex = index;

                    setState(() {});
                  },
                ),

                Text('Title', style: Theme.of(context).textTheme.titleSmall),

                TextFieldCustom(
                  hintText: args.eventTitle,

                  onChanged: (value) {
                    eventTitle = value;
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the eventTitle';
                    }

                    return null;
                  },
                ),

                Text(
                  'Description',

                  style: Theme.of(context).textTheme.titleSmall,
                ),

                TextFieldCustom(
                  hintText: args.eventDescription,

                  maxLine: 5,

                  onChanged: (value) {
                    eventDescription = value;
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the eventDescription';
                    }

                    return null;
                  },
                ),

                DateWidget(
                  onPressed: chooseDate,

                  title: dateTime == null
                      ? DateFormat('MMM d').format(args.eventDate)
                      : formatDate!,
                ),

                TimeWidget(
                  onPressed: chooseTime,

                  title: choosedTime == null ? args.eventTime : formatTime!,
                ),

                ElevatedButtonCustom(
                  onPressed: updateEvent,
                  text: 'Update Event',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var data = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime.now(),

      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (data != null) {
      setState(() {
        dateTime = data;

        formatDate = DateFormat('MMM d').format(dateTime!);
      });
    }
  }
  void chooseTime() async {
    var time = await showTimePicker(
      context: context,

      initialTime: TimeOfDay.now(),
    );

    choosedTime = time;

    if (time != null) {
      setState(() {
        formatTime = time.format(context);
      });
    }
  }

  void updateEvent() {
    if (_formKey.currentState!.validate()) {
      eventImage = eventsImagesLight[selectedIndex];
      eventImageDark = eventsImagesDark[selectedIndex];
      selectedEventName = eventName[selectedIndex];

      var event = EventModel(
        id: args.id,

        eventImage: eventImage,
        eventImageDark: eventImageDark,

        eventName: selectedEventName,

        eventTitle: eventTitle ?? args.eventTitle,

        eventDescription: eventDescription ?? args.eventDescription,

        eventDate: dateTime ?? args.eventDate,

        eventTime: formatTime ?? args.eventTime,
      );

      FireBaseUtils.updateEvent(event);

      Navigator.pop(context);
    }
  }
}
