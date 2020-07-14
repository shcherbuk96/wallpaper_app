import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/colors_constants.dart';
import 'package:wallpaper_app/constants/fonts_constants.dart';
import 'package:wallpaper_app/constants/icons_constants.dart';
import 'package:wallpaper_app/convertFromHex.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 50, right: 16),
      child: Container(
        height: 32,
        child: Row(
          children: [
            Expanded(
              child: _searchTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(camera_icon),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchTitle() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      autofocus: false,
      style: TextStyle(
          color: colorFromHex(white).withOpacity(0.4),
          fontSize: 18,
          fontFamily: helveticaNeueCyrBold),
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          search_icon,
          color: colorFromHex(white).withOpacity(0.4),
          height: 15,
        ),
        filled: true,
        fillColor: colorFromHex(white).withOpacity(0.1),
        hintText: "Search",
        hintStyle: TextStyle(
            color: colorFromHex(white).withOpacity(0.4), fontSize: 14),
        contentPadding: EdgeInsets.zero,
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
        disabledBorder: _outlineInputBorder(),
        errorBorder: _outlineInputBorder(),
      ),
      textAlign: TextAlign.start,
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide:
            BorderSide(color: colorFromHex(white).withOpacity(0.1), width: 0));
  }
}
