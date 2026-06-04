import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              themeProvider.isLightMode()
                  ? AppAssets.onboardingLight4
                  : AppAssets.onboardingDark4,
            ),
          ).animate().scaleX(),

          const SizedBox(height: 20),

          Text(
            AppLocalizations.of(context)!.titleOnBoarding4,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 10),

          Text(
            AppLocalizations.of(context)!.descriptionOnBoarding4,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}