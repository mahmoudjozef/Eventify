import 'package:eventify/Screens/onBording/Widgets/LanguageItem.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/l10n_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageWidgetOnBoarding extends StatelessWidget {
  const LanguageWidgetOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<L10nProvider>(context);
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Spacer(),
        LanguageItem(text: 'English', isSelected: languageProvider.currentLanguage==('en'), onTap: () {
          languageProvider.changeLanguage('en');

        },),
        SizedBox(width: 14,),
        LanguageItem(text: 'Arabic', isSelected: languageProvider.currentLanguage==('ar') , onTap: () {
          languageProvider.changeLanguage('ar');

        },),
      ],
    );
  }
}
