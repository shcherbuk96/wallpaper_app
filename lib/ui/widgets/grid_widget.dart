import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wallpaper_app/constants/colors_constants.dart';
import 'package:wallpaper_app/constants/fonts_constants.dart';
import 'package:wallpaper_app/constants/icons_constants.dart';
import 'package:wallpaper_app/convertFromHex.dart';
import 'package:wallpaper_app/data/service_locator.dart';
import 'package:wallpaper_app/ui/screens/home_page_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      builder: (context, state) => state is LoadingState
          ? Expanded(
              child: Container(
                child: Center(
                  child: SpinKitCircle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Expanded(
              child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: _bloc.wallpapers.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      child: Column(
                        children: [
                          _imageCard(index),
                          _textCard(index),
                        ],
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(2),
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 16.0,
                  )),
            ),
    );
  }

  Widget _imageCard(index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: _bloc.wallpapers[index].largeImageURL,
          fadeInCurve: Curves.bounceIn,
        ));
  }

  Widget _textCard(index) {
    return Row(
      children: [
        Expanded(
          // alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Text(
              _bloc.wallpapers[index].user,
              style: TextStyle(
                  color: colorFromHex(white),
                  fontFamily: helveticaNeueCyrBold,
                  fontSize: 10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, right: 10),
          child: SvgPicture.asset(more_icon),
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
