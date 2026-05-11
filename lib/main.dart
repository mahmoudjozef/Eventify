import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/providers/l10n_Provider.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/SplashScreen.dart';
import 'Screens/home/homeScreen.dart';
import 'generated/codegen_loader.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ar'),
    ],
      path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),

          child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => L10nProvider(),),
            ChangeNotifierProvider(create: (context) => ThemeProvider(),),
          ],
          child: MyApp()))
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightMode,
      darkTheme:  AppTheme.darkMode,
      themeMode: ThemeMode.system,
      initialRoute: AppRouts.routeNamedHomeScreen,
      routes: {
        AppRouts.routeNamedSplashScreen: (context) => SplashScreen(),
        AppRouts.routeNamedHomeScreen: (context) => HomeScreen(),
      },
    );
  }
}

