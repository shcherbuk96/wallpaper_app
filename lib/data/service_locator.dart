import 'package:get_it/get_it.dart';
import 'package:wallpaper_app/data/rest_api.dart';
import 'package:wallpaper_app/ui/screens/home_page/home_page_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RestClient.createRestClient());
  locator.registerLazySingleton(() => HomePageBloc());
}

RestClient createRestClient() => locator.get<RestClient>();
HomePageBloc createHomePageBloc() => locator.get<HomePageBloc>();
