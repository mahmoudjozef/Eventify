import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/DarkModeWidget.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/LogoutWidget.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/widgets/languageWidget.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            children: [
              Center(
                    child: Image.asset(
                      AppAssets.avatarProfile,
                      width: 116,
                      height: 116,
                    ),
                  )
                  .animate()
                  .scale(duration: 1000.ms, curve: Curves.easeOutBack)
                  .fadeIn(),
              SizedBox(height: 10),
              //nameAnimation
              DefaultTextStyle(
                style: AppStyle.bold20Black.copyWith(
                  color: themeProvider.isLightMode()
                      ? AppColor.mainTextColorLight
                      : AppColor.mainTextColorDark,
                ),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      speed: Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
              //mailAnimation
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: AppStyle.bold14gray.copyWith(
                  color: themeProvider.isLightMode()
                      ? AppColor.secTextColorLight
                      : AppColor.secTextColorDark,
                ),
              ).animate(delay: 1000.ms).fadeIn(duration: 500.ms),
              SizedBox(height: height * 0.08),
              DarkModeWidget()
                  .animate(delay: 1200.ms)
                  .slideX(begin: 0.2)
                  .fadeIn(),
              SizedBox(height: height * (16 / 812)),
              LanguageWidget()
                  .animate(delay: 1400.ms)
                  .slideX(begin: 0.2)
                  .fadeIn(),
              SizedBox(height: height * (16 / 812)),
              LogoutWidget()
                  .animate(delay: 1500.ms)
                  .slideX(begin: 0.2)
                  .fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}
