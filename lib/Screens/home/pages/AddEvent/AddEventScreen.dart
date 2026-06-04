import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/Screens/home/pages/AddEvent/widget/DateWidget.dart';
import 'package:eventify/Screens/home/pages/AddEvent/widget/TimeWidget.dart';
import 'package:eventify/Screens/home/pages/homePage/widget/ChipsUi.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/model/EventModel.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
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
    AppAssets.sportDark,
    AppAssets.birthDayDark,
    AppAssets.meetingDark,
    AppAssets.bookClubDark,
    AppAssets.exhibitionDark,
  ];
  int selectedIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  String eventName = '';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    evetsName = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
    ];
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                themeProvider.isLightMode()
                      ? eventsImagesLight[selectedIndex]
                      : eventsImagesDark[selectedIndex],
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ChipUi(
                        eventName: evetsName[index],
                        isSelected: selectedIndex == index,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                      );
                    },
                    itemCount: evetsName.length,
                  ),
                ),

                Text('Title', style: Theme.of(context).textTheme.titleSmall),
                TextFieldCustom(
                  hintText: 'Title',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the eventTitle';
                    }
                    return null;
                  },
                  onChanged: (newText) {
                    return eventTitle = newText;
                  },
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextFieldCustom(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the eventTitle';
                    }
                    return null;
                  },
                  onChanged: (newText) {
                    return eventDescription  = newText;
                  },
                  hintText: 'Description',
                  maxLine: 5,
                ),
                DateWidget(
                  onPressed: chooseDate,
                  title: dateTime == null ? 'Choose Date' : formatDate!,
                ),
                TimeWidget(
                  onPressed: chooseTime,
                  title: choosedTime == null ? 'Choose Time' : formatTime!,
                ),
                ElevatedButtonCustom(onPressed: () => addEvent(themeProvider), text: 'Add Event'),
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
        formatDate = DateFormat('MMM d, yyyy').format(dateTime!);
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
  void addEvent(ThemeProvider themeProvider) {
    eventImage=eventsImagesLight[selectedIndex];
    eventImageDark=eventsImagesDark[selectedIndex];
    eventName = evetsName[selectedIndex];
    if (_formKey.currentState!.validate()) {

      var event = EventModel(
        eventImage: eventImage,
        eventImageDark: eventImageDark,
        eventName: eventName,
        eventTitle: eventTitle!,
        eventDescription: eventDescription!,
        eventDate: dateTime!,
        eventTime: formatTime!,
      );

      FireBaseUtils.addEventToFireStore(event);

      Navigator.pop(context);
    }
  }
}
