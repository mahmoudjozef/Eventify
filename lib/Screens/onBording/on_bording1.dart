import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/onBording/Widgets/LanguageWidget.dart';
import 'package:eventify/Screens/onBording/Widgets/theme_widget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                themeProvider.isLightMode()
                    ? AppAssets.onboardingLight
                    : AppAssets.onboardingDark,
              ),
            ),
            SizedBox(height: 24,),
            Text(
              AppLocalizations.of(context)!.titleOnBoarding1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppLocalizations.of(context)!.descriptionOnBoarding1,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 18,),
            LanguageWidgetOnBoarding(),
            SizedBox(height: 18,),
            ThemeWidgetOnBoarding(),
            SizedBox(height: 24,),
            ElevatedButtonCustom(
              text: AppLocalizations.of(context)!.letsStart,
              onPressed: (){
             Navigator.pushNamed(context, AppRouts.routeNamedOnBoarding2Screen);
            },)
          ],
        ),
      ),
    );
  }
}
