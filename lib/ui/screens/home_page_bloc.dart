import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/constants/api_constants.dart';
import 'package:wallpaper_app/data/hits.dart';
import 'package:wallpaper_app/data/service_locator.dart';

abstract class HomePageState {
  const HomePageState();
}

class LoadingState extends HomePageState {}

class ErrorState extends HomePageState {}

class BusyState extends HomePageState {}

abstract class HomePageEvent {
  const HomePageEvent();
}

class InitEvent extends HomePageEvent {}

class PopularsEvent extends HomePageEvent {}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  List<Hits> wallpapers = [];
  var client = createRestClient();

  HomePageBloc() {
    add(PopularsEvent());
  }

  HomePageState get initialState => LoadingState();

  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is PopularsEvent) {
      yield LoadingState();
      wallpapers = await client
          .getPopularImages(api_key, "popular", "vertical")
          .then((value) => value.body.hits);
      yield BusyState();
    }
  }

  Future init() async {
    // wallpapers = await client
    //     .getPopularImages("popular")
    //     .then((value) => value.body.hits);
  }
}
