import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/DarkModeWidget.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/LogoutWidget.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/languageWidget.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * (15 / 812),
            horizontal: width * (15 / 375),
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  AppAssets.avatarProfile,
                  width: 116,
                  height: 116,
                ),
              ),
              SizedBox(height: height * (16 / 812)),
              Text(
                'John Safwat',
                style: AppStyle.bold20Black.copyWith(
                  color: themeProvider.isLightMode()
                      ? AppColor.mainTextColorLight
                      : AppColor.mainTextColorDark,
                ),
              ),
              Text(
                'johnsafwat.route@gmail.com',
                style: AppStyle.bold14gray.copyWith(
                  color: themeProvider.isLightMode()
                      ? AppColor.secTextColorLight
                      : AppColor.secTextColorDark,
                ),
              ),
              SizedBox(height: height * 0.08),
              DarkModeWidget(),
              SizedBox(height: height * (16 / 812)),
              LanguageWidget(),
                SizedBox(height: height * (16 / 812)),
              LogoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
