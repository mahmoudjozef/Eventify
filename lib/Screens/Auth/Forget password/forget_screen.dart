import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeProvider.isLightMode()
              ? AppColor.blackColor
              : AppColor.whiteColor,
        ),
        title: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:14),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                themeProvider.isLightMode()
                    ? AppAssets.forgetAccountLight
                    : AppAssets.forgetAccountDark,
              ),
            ),
            SizedBox(height: height * 0.06),
            ElevatedButtonCustom(onPressed:  () {

            }, text: AppLocalizations.of(context)!.forgetPassword)
          ],
        ),
      ),
    );
  }
}
