// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$RestClient extends RestClient {
  _$RestClient([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestClient;

  @override
  Future<Response<Wallpapers>> getPopularImages(
      String key, String order, String orientation) {
    final $url = 'https://pixabay.com/api/';
    final $params = <String, dynamic>{
      'key': key,
      'order': order,
      'orientation': orientation
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Wallpapers, Wallpapers>($request);
  }
}
