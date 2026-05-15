import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/l10n_Provider.dart';
import '../../../../../providers/theme_provider.dart';
import '../../../../../utils/AppColor.dart';
import '../../../../../utils/AppStyle.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var providerTheme = Provider.of<ThemeProvider>(context);
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: providerTheme.isLightMode()?AppColor.inputsColorLight:AppColor.inputsColorDark,
        borderRadius: BorderRadius.circular(16),border: BoxBorder.all(color: providerTheme.isLightMode()?AppColor.strokeColorLight:AppColor.strokeColorDark),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * (16 / 375),
        ),
        child: Row(
          children: [
            Text(AppLocalizations.of(context)!.logout
              , style: AppStyle.medium18Black.copyWith(
              color: providerTheme.isLightMode()
                  ? AppColor.mainTextColorLight
                  : AppColor.mainTextColorDark,
            ),),
            Spacer(),
            IconButton(onPressed: () {
            }, icon: Icon(Icons.login,color: AppColor.ridColor))
          ],
        ),
      ),
    );
  }
  void showLanguageDialog(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var l10nProvider = Provider.of<L10nProvider>(context, listen: false);

    showModalBottomSheet(
      backgroundColor:themeProvider.isLightMode()
          ? AppColor.inputsColorLight
          : AppColor.inputsColorDark,
      context: context,
      builder: (context) {
        var currentL10n = l10nProvider.currentLanguage;

        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Theme',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),

              ListTile(
                title: Text(
                  'English',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: currentL10n == 'en'
                    ? Icon(
                  Icons.check,
                  color: themeProvider.isLightMode()
                      ? AppColor.mainColorLight
                      : AppColor.mainColorDark,
                )
                    : null,
                onTap: () {
                  l10nProvider.changeLanguage('en');

                  context.setLocale(
                    Locale('en'),
                  );
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: Text(
                  'Arabic',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: currentL10n == 'ar'
                    ? Icon(
                  Icons.check,
                  color: themeProvider.isLightMode()
                      ? AppColor.mainColorLight
                      : AppColor.mainColorDark,
                )
                    : null,
                onTap: () {
                  l10nProvider.changeLanguage('ar');

                  context.setLocale(
                    Locale('ar'),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
