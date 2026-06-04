import 'package:easy_localization/easy_localization.dart';
import 'package:eventify/Screens/Auth/Forget%20password/forget_screen.dart';
import 'package:eventify/Screens/Auth/Login/login_screen.dart';
import 'package:eventify/Screens/Auth/register/MotionScreen.dart';
import 'package:eventify/Screens/Auth/register/Register_Screen.dart';
import 'package:eventify/Screens/home/pages/AddEvent/AddEventScreen.dart';
import 'package:eventify/Screens/home/pages/Event_details/Event_details.dart';
import 'package:eventify/Screens/home/pages/edit_screen/Edit_screen.dart';
import 'package:eventify/Screens/onBording/Onboarding_Screen.dart';
import 'package:eventify/Screens/onBording/on_Boarding4.dart';
import 'package:eventify/Screens/onBording/on_boarding3.dart';
import 'package:eventify/Screens/onBording/on_bording1.dart';
import 'package:eventify/Screens/onBording/on_bording2.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/l10n_Provider.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/AppTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/home/homeScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => L10nProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var l10nProvider = Provider.of<L10nProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(l10nProvider.currentLanguage),
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: themeProvider.appTheme,
      initialRoute: AppRouts.routeNamedSplashScreen,
      routes: {
        AppRouts.routeNamedSplashScreen: (context) => SplashScreen(),
        AppRouts.routeNamedMotionScreen: (context) => MotionScreen(),
        AppRouts.routeNamedOnBoardingScreen: (context) => OnboardingScreen(),
        AppRouts.routeNamedLoginScreen: (context) => LoginScreen(),
        AppRouts.routeNamedRegisterScreen: (context) => RegisterScreen(),
        AppRouts.routeNamedForgetScreen: (context) => ForgetScreen(),
        AppRouts.routeNamedHomeScreen: (context) => HomeScreen(),
        AppRouts.routeNamedAddEventScreen: (context) => AddEventScreen(),
        AppRouts.routeNamedAddEventDetailsScreen: (context) => EventDetails(),
        AppRouts.routeNamedAddEventEditScreen: (context) => EditScreen(),
      },
    );
  }
}

