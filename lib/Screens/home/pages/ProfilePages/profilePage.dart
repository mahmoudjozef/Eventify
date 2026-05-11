import 'package:eventify/utils/AppAssets.dart';
import 'package:eventify/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Column(
            children: [
              Center(child: Image.asset(AppAssets.avatarProfile, width: 116, height: 116)),
              Text(
                'John Safwat',
                style: AppStyle.bold20Black,
              ),
              Text(
                'johnsafwat.route@gmail.com',
                style: AppStyle.bold14gray,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
