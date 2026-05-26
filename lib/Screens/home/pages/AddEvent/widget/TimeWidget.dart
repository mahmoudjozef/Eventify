import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  TimeWidget extends StatelessWidget {
    TimeWidget({super.key,required this.title,required this.onPressed});
String title;
VoidCallback onPressed;
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
        Text('Event Time'),
        Spacer(),
        TextButton(onPressed:onPressed , child: Text(title,style:Theme.of(context).textTheme.bodySmall))

      ],
    );
  }
}
