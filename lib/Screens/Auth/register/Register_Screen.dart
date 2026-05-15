import 'package:eventify/Screens/Auth/Login/widget/GoogleWidget.dart';
import 'package:eventify/Screens/Auth/Login/widget/or_widget.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen ({super.key});
  //height 812
  //width 375
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Text(
              'Create your account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: height * 0.02),
            TextFieldCustom(
              prefixIcon: Icons.email,
              hintText: AppLocalizations.of(context)!.enterYourEmail,
            ),
            SizedBox(height: height * 0.01),
            TextFieldCustom(
              prefixIcon: Icons.person,
              hintText: AppLocalizations.of(context)!.enterYourName,
            ),
            SizedBox(height: height * 0.01),
            TextFieldCustom(
              prefixIcon: Icons.lock,
              suffix: Icons.visibility,
              hintText: AppLocalizations.of(context)!.enterYourPassword,
            ),
            SizedBox(height: height * 0.01),
            TextFieldCustom(
              prefixIcon: Icons.lock,
              suffix: Icons.visibility,
              hintText: AppLocalizations.of(context)!.enterYourPassword,
            ),
            SizedBox(height: height * 0.02),
            ElevatedButtonCustom(
              text: AppLocalizations.of(context)!.signup,
              onPressed: () {},
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.alreadyHaveAnAccount,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.login,
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
