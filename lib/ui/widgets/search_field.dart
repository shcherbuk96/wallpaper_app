import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/constants/assets.dart';
import 'package:wallpaper_app/constants/branding_colors.dart';
import 'package:wallpaper_app/constants/font_size.dart';
import 'package:wallpaper_app/constants/fonts_constants.dart';
import 'package:wallpaper_app/constants/insets_constants.dart';
import 'package:wallpaper_app/constants/radiuses.dart';
import 'package:wallpaper_app/convertFromHex.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Insets.x4, top: Insets.x12_5, right: Insets.x4),
      child: Container(
        height: Insets.x8,
        child: Row(
          children: [
            Expanded(
              child: _searchTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Insets.x2),
              child: SvgPicture.asset(
                Assets.camera_icon,
              ),
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
          color: colorFromHex(BrandingColors.white).withOpacity(0.4),
          fontSize: 14,
          fontFamily: FontsFamily.helveticaNeueCyrBold),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(Insets.x2),
          child: SvgPicture.asset(
            Assets.search_icon,
          ),
        ),
        filled: true,
        fillColor: colorFromHex(BrandingColors.white).withOpacity(0.1),
        hintText: "Search",
        hintStyle: TextStyle(
            color: colorFromHex(BrandingColors.white).withOpacity(0.4),
            fontSize: FontSizes.normal),
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
        borderRadius:
            const BorderRadius.all(Radius.circular(Radiuses.small_1x)),
        borderSide: BorderSide(
            color: colorFromHex(BrandingColors.white).withOpacity(0.1),
            width: 0));
  }
}
