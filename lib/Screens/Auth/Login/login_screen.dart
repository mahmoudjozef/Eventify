import 'package:eventify/Screens/Auth/Login/widget/GoogleWidget.dart';
import 'package:eventify/Screens/Auth/Login/widget/or_widget.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  //height 812
  //width 375
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.transparent),
        title: Image.asset(
          themeProvider.isLightMode()
              ? AppAssets.evntlylight
              : AppAssets.evntlyDark,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  AppLocalizations.of(context)!.loginToYourAccount,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: height * 0.02),
                TextFieldCustom(
                  controller: emailController,
                  prefixIcon: Icons.email,
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the email';
                    }

                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value);
                    if (!emailValid) {
                      return 'please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.01),
                TextFieldCustom(
                  maxLine: 1,
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  suffix: Icons.visibility_off,
                  obscureText: true,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the email';
                    }
                    RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    );
                    if (value.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouts.routeNamedForgetScreen,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                ElevatedButtonCustom(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var result = await FireBaseUtils.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if(result != null){

                        await FirebaseAuth.instance.currentUser?.reload();

                        Navigator.pushReplacementNamed(
                          context,
                          AppRouts.routeNamedHomeScreen,
                        );

                      }
                    }
                  },
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAnAccount,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouts.routeNamedRegisterScreen,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signup,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                OrWidget(),
                SizedBox(height: height * 0.02),
                GoogleWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
