import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies/helpers/fonts.dart';
import 'package:movies/screens/home_screen/content_screen.dart';
import 'package:movies/screens/home_screen/profile_screen.dart';
import 'package:movies/screens/home_screen/search_screen.dart';
import 'package:movies/screens/home_screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final iconList = <IconData>[
    Icons.home,
    Icons.search_outlined,
    Icons.person_outline,
    Icons.settings
  ];

  final pages = <Widget>[
    ContentScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];
  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOVII", style: fonts.title),
      ),
      body: pages[_bottomNavIndex],
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Color(0xff161616),
          elevation: 50,
          inactiveColor: Colors.white,
          blurEffect: true,
          iconSize: 30,
          activeColor: Colors.red,
          splashColor: Colors.red,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          shadow: BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: Colors.black.withOpacity(0.12),
          ),
          onTap: (index) {

            setState(() {
              _bottomNavIndex = index;
            });
          }),
      //other params
    );
  }
}
