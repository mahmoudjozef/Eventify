import 'package:eventify/providers/l10n_Provider.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppColor.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var l10n = Provider.of<L10nProvider>(context);
    var currentL10n = l10n.currentLanguage;
    return InkWell(
      onTap: () {
        l10n.changeLanguage('Ar');
      },
      child: Container(
        width: 32,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: themeProvider.isLightMode()
              ? AppColor.mainColorLight
              : AppColor.mainColorDark,
        ),
        child: Center(child: Text(currentL10n=='en'?'EN':'Ar', style: AppStyle.small16White)),
      ),
    );
  }
}
