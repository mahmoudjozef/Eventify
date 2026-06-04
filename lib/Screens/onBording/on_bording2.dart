import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              themeProvider.isLightMode()
                  ? AppAssets.onboardingLight2
                  : AppAssets.onboardingDark2,
            ),
          ).animate().scaleX(),

          const SizedBox(height: 20),

          Text(
            AppLocalizations.of(context)!.titleOnBoarding2,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 10),

          Text(
            AppLocalizations.of(context)!.descriptionOnBoarding2,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
