import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper_app/data/hits.dart';

part 'wallpapers.g.dart';

@JsonSerializable()
class Wallpapers {
  int total;
  int totalHits;
  List<Hits> hits;

  Wallpapers({this.total, this.totalHits, this.hits});

  static const fromJsonFactory = _$WallpapersFromJson;

  factory Wallpapers.fromJson(Map<String, dynamic> json) =>
      _$WallpapersFromJson(json);

  Map<String, dynamic> toJson() => _$WallpapersToJson(this);
}
