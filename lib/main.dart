import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors_constants.dart';
import 'package:wallpaper_app/data/service_locator.dart';
import 'package:wallpaper_app/ui/screens/home_page.dart';

import 'convertFromHex.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: colorFromHex(black),
      ),
      home: HomePage(),
    );
  }
}
