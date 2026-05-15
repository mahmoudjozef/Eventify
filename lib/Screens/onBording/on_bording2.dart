import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: themeProvider.isLightMode()?Colors.black:Colors.white),
        title: Image.asset(
          themeProvider.isLightMode()
              ? AppAssets.evntlylight
              : AppAssets.evntlyDark,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                themeProvider.isLightMode()
                    ? AppAssets.onboardingLight2
                    : AppAssets.onboardingDark2,
              ),
            ),
            SizedBox(height: 20,),
            Text(AppLocalizations.of(context)!.titleOnBoarding2,style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 10,),
            Text(AppLocalizations.of(context)!.descriptionOnBoarding2,style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(height: 15,),
            ElevatedButtonCustom(
              text: AppLocalizations.of(context)!.next,
              onPressed: (){
              Navigator.pushNamed(context, AppRouts.routeNamedOnBoarding3Screen);
            },)

          ],
        ),
      ),
    );
  }
}
