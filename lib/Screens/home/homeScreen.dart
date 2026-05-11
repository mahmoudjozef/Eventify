import 'package:eventify/Screens/home/pages/FavoritePages/favoritePage.dart';
import 'package:eventify/Screens/home/pages/ProfilePages/profilePage.dart';
import 'package:eventify/Screens/home/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens =
  [HomePage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: [
          navigationBarItem(
            icon: Icons.home,
            label: "Home",
            selectedIcon: Icons.home,
            unSelectedIcon: Icons.home_outlined,
            index: 0,
          ),
          navigationBarItem(
            icon: Icons.event,
            label: "Favorite",
            selectedIcon: Icons.favorite,
            unSelectedIcon: Icons.favorite_border,
            index: 1,
          ),
          navigationBarItem(
            icon: Icons.person,
            label: "Profile",
            selectedIcon: Icons.person,
            unSelectedIcon: Icons.person_outline,
            index: 2,
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
  BottomNavigationBarItem navigationBarItem({
    required IconData selectedIcon,
    required IconData unSelectedIcon,
    required IconData icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index ? Icon(selectedIcon) : Icon(unSelectedIcon),
      label: label,
    );
  }
}
