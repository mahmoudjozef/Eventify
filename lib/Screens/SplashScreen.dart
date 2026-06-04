import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration(seconds: 3),(){Navigator.pushNamed(context, AppRouts.routeNamedOnBoardingScreen);});
  }
  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(

      body: Center(
        child: Image.asset(
          themeProvider.isLightMode()
              ? AppAssets.SplashLogo
              : AppAssets.SplashLogoDark,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
