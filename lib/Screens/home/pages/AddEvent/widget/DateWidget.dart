import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Icon(
          Icons.date_range,
          color: theme.isLightMode()
              ? AppColor.mainColorLight
              : AppColor.mainColorDark,
        ),
        SizedBox(width: 5,),
        Text('Event Date'),
        Spacer(),
        TextButton(onPressed: () {

        }, child: Text('Choose date'))
      ],
    );
  }
}
