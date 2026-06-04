import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/onBording/on_Boarding4.dart';
import 'package:eventify/Screens/onBording/on_boarding3.dart';
import 'package:eventify/Screens/onBording/on_bording1.dart';
import 'package:eventify/Screens/onBording/on_bording2.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          themeProvider.isLightMode()
              ? AppAssets.evntlylight
              : AppAssets.evntlyDark,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              scrollDirection: Axis.vertical,
              children: [
                Onboarding1(),
                OnBoarding2(),
                OnBoarding3(),
                OnBoarding4(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButtonCustom(
              onPressed: () {
                if(currentIndex==3){
                  Navigator.pushNamed(context, AppRouts.routeNamedLoginScreen);
                }else{

                  pageController.nextPage(

                    duration: const Duration(milliseconds: 600),

                    curve: Curves.easeInOutQuart,

                  );
                }
              },
              text: currentIndex == 3
                  ? AppLocalizations.of(context)!.getStarted
                  : AppLocalizations.of(context)!.next,
            ),
          ),
        ],
      ),
    );
  }
}
