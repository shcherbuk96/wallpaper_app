import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/constants/assets.dart';
import 'package:wallpaper_app/constants/branding_colors.dart';
import 'package:wallpaper_app/constants/fonts_constants.dart';
import 'package:wallpaper_app/constants/insets_constants.dart';
import 'package:wallpaper_app/constants/radiuses.dart';
import 'package:wallpaper_app/convertFromHex.dart';
import 'package:wallpaper_app/data/service_locator.dart';
import 'package:wallpaper_app/ui/screens/details_page/details_page.dart';
import 'package:wallpaper_app/ui/screens/home_page/home_page_bloc.dart';

class WallpapersGrid extends StatefulWidget {
  @override
  _WallpapersGridState createState() => _WallpapersGridState();
}

class _WallpapersGridState extends State<WallpapersGrid> {
  var _bloc = createHomePageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: _bloc,
      builder: (context, state) => Expanded(
        child: Container(
          padding: EdgeInsets.all(Insets.x4),
          child: Center(
              child: state is LoadingState
                  ? SpinKitFadingCircle(
                      color: Colors.white,
                    )
                  : StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: _bloc.wallpapers.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _itemCard(index),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: Insets.x6,
                      crossAxisSpacing: Insets.x4,
                    )),
        ),
      ),
    );
  }

  _openDetailsPage(context, index, imageUrl) {
    final route = MaterialPageRoute(
      builder: (context) => DetailsPage(index: index, imageUrl: imageUrl),
    );
    Navigator.push(context, route);
  }

  Widget _itemCard(index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Radiuses.small_2x),
      child: Container(
        color: colorFromHex(BrandingColors.white).withOpacity(0.1),
        child: Column(
          children: [
            _imageCard(index),
            _textCard(index),
            SizedBox(
              height: Insets.x2,
            )
          ],
        ),
      ),
    );
  }

  Widget _imageCard(index) {
    return Hero(
        tag: "photo-$index",
        child: GestureDetector(
            onTap: () => _openDetailsPage(
                context, index, _bloc.wallpapers[index].largeImageURL),
            child: CachedNetworkImage(
              imageUrl: _bloc.wallpapers[index].largeImageURL,
              placeholder: (context, url) => Container(
                height: 160,
                child: SpinKitChasingDots(
                  color: colorFromHex(BrandingColors.white).withOpacity(0.1),
                ),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            )));
  }

  Widget _textCard(index) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: Insets.x2_5, top: Insets.x2),
            child: Text(
              _bloc.wallpapers[index].user,
              style: TextStyle(
                  color: colorFromHex(BrandingColors.white),
                  fontFamily: FontsFamily.helveticaNeueCyrBold,
                  fontSize: Insets.x2_5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Insets.x1_5, right: Insets.x2_5),
          child: SvgPicture.asset(Assets.more_icon),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
