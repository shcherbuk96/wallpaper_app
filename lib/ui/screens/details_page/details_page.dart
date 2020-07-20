import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper_app/constants/branding_colors.dart';
import 'package:wallpaper_app/constants/insets_constants.dart';
import 'package:wallpaper_app/convertFromHex.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  final String imageUrl;
  const DetailsPage({this.index, this.imageUrl});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorFromHex(BrandingColors.black),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: Insets.x100,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: "photo-${widget.index}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.imageUrl,
                        placeholder: (context, url) => Container(
                          height: 160,
                          child: SpinKitChasingDots(
                            color: colorFromHex(BrandingColors.white)
                                .withOpacity(0.1),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
