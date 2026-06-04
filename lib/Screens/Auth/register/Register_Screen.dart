import 'package:eventify/Screens/Auth/Login/widget/GoogleWidget.dart';
import 'package:eventify/Screens/Auth/Login/widget/or_widget.dart';
import 'package:eventify/Screens/Widgets/ElevetedBottom.dart';
import 'package:eventify/Screens/Widgets/TextFieldCustom.dart';
import 'package:eventify/l10n/app_localizations.dart';
import 'package:eventify/providers/theme_provider.dart';
import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppRouts.dart';
import 'package:eventify/utils/FireBaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                  'Create your account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: height * 0.02),
                TextFieldCustom(
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
                  controller: emailController,
                  prefixIcon: Icons.email,
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                ),
                SizedBox(height: height * 0.01),
                TextFieldCustom(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter the name';
                    }
                    if (value.length < 3) {
                      return 'name must be at least 3 characters';
                    }
                    return null;
                  },
                  controller: nameController,
                  prefixIcon: Icons.person,
                  hintText: AppLocalizations.of(context)!.enterYourName,
                ),
                SizedBox(height: height * 0.01),
                TextFieldCustom(
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
                  controller: passwordController,
                  maxLine: 1,
                  prefixIcon: Icons.lock,
                  suffix: Icons.visibility_off,
                  obscureText: true,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                ),
                SizedBox(height: height * 0.01),
                TextFieldCustom(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter match password';
                    }
                    if (value != passwordController.text) {
                      return 'password not match';
                    }
                    if (value.length < 6) {
                      return 'password must be at least 6 characters';
                    }
                    return null;
                  },
                  controller: passwordConfirmController,
                  maxLine: 1,
                  prefixIcon: Icons.lock,
                  suffix: Icons.visibility_off,
                  obscureText: true,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                ),
                SizedBox(height: height * 0.02),
                ElevatedButtonCustom(
                  text: AppLocalizations.of(context)!.signup,
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                     var result = await FireBaseUtils.register(
                          emailController.text, passwordController.text, nameController.text
                      );
                     if(result !=null){
                       print("Success");
                       Navigator.pushReplacementNamed(context, AppRouts.routeNamedMotionScreen);
        
                     }else{
                       print("Error");
                     }
                    }
        
                  },
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.alreadyHaveAnAccount,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouts.routeNamedLoginScreen,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
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
