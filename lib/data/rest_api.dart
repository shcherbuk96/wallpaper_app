import 'package:chopper/chopper.dart';
import 'package:wallpaper_app/constants/api_constants.dart';
import 'package:wallpaper_app/data/json_decoder.dart';
import 'package:wallpaper_app/data/wallpapers.dart';
part 'rest_api.chopper.dart';

@ChopperApi(baseUrl: api_url)
abstract class RestClient extends ChopperService {
  @Get()
  Future<Response<Wallpapers>> getPopularImages(@Query('key') String key,
      @Query('order') String order, @Query('orientation') String orientation);

  static RestClient createRestClient() {
    final client = ChopperClient(
        baseUrl: api_url,
        services: [_$RestClient()],
        converter: JsonSerializableConverter());
    return _$RestClient(client);
  }
}
