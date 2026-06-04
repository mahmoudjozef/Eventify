import 'package:eventify/Screens/onBording/Widgets/LanguageWidget.dart';
import 'package:eventify/Screens/onBording/Widgets/theme_widget.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              themeProvider.isLightMode()
                  ? AppAssets.onboardingLight
                  : AppAssets.onboardingDark,
            ),
          ).animate().scaleX(),

          const SizedBox(height: 24),

          Text(
            AppLocalizations.of(context)!.titleOnBoarding1,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            AppLocalizations.of(context)!.descriptionOnBoarding1,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 18),

          LanguageWidgetOnBoarding()
              .animate(delay: 1200.ms)
              .slideX(begin: 0.2)
              .fadeIn(),
          const SizedBox(height: 18),

          ThemeWidgetOnBoarding()
              .animate(delay: 1200.ms)
              .slideX(begin: 0.2)
              .fadeIn(),
        ],
      ),
    );
  }
}
