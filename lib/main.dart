import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/branding_colors.dart';
import 'package:wallpaper_app/data/service_locator.dart';
import 'package:wallpaper_app/ui/screens/home_page/home_page.dart';

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
        primaryColor: colorFromHex(BrandingColors.black),
      ),
      home: HomePage(),
    );
  }
}
