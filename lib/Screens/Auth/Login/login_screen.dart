import 'package:eventify/Screens/Auth/Login/widget/GoogleWidget.dart';
import 'package:eventify/Screens/Auth/Login/widget/or_widget.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //height 812
  //width 375
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.transparent),
        title: Image.asset(
          themeProvider.isLightMode()
              ? AppAssets.evntlylight
              : AppAssets.evntlyDark,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Text(
              AppLocalizations.of(context)!.loginToYourAccount,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: height * 0.02),
            TextFieldCustom(
              prefixIcon: Icons.email,
              hintText: AppLocalizations.of(context)!.enterYourEmail,
            ),
            SizedBox(height: height * 0.01),
            TextFieldCustom(
              prefixIcon: Icons.lock,
              suffix: Icons.visibility,
              hintText: AppLocalizations.of(context)!.enterYourPassword,
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {Navigator.pushNamed(context, AppRouts.routeNamedForgetScreen);},
                  child: Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            ElevatedButtonCustom(
              text: AppLocalizations.of(context)!.login,
              onPressed: () {Navigator.pushNamed(context, AppRouts.routeNamedHomeScreen);},
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.dontHaveAnAccount,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextButton(
                  onPressed: () {Navigator.pushNamed(context, AppRouts.routeNamedRegisterScreen);},
                  child: Text(
                    AppLocalizations.of(context)!.signup,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            OrWidget(),
            SizedBox(height: height * 0.02),
            GoogleWidget(),
          ],
        ),
      ),
    );
  }
}
