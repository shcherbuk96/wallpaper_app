import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors_constants.dart';
import 'package:wallpaper_app/constants/icons_constants.dart';
import 'package:wallpaper_app/convertFromHex.dart';
import 'package:wallpaper_app/ui/widgets/search_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorFromHex(black),
        bottomNavigationBar: _bottomNavBar(),
        body: Column(
          children: [
            SearchField(),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(pinterest_icon),
              activeIcon: Image.asset(pinterest_select_icon),
              title: Text("Pinterest"),
              backgroundColor: colorFromHex(black)),
          BottomNavigationBarItem(
              icon: Image.asset(explore_icon),
              title: Text("Explore"),
              backgroundColor: colorFromHex(black)),
          BottomNavigationBarItem(
              icon: Image.asset(chat_icon),
              title: Text("Chat"),
              backgroundColor: colorFromHex(black)),
          BottomNavigationBarItem(
              icon: Image.asset(profile_icon),
              title: Text("Profile"),
              backgroundColor: colorFromHex(black)),
        ]);
  }
}
