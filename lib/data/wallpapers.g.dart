// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpapers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallpapers _$WallpapersFromJson(Map<String, dynamic> json) {
  return Wallpapers(
    total: json['total'] as int,
    totalHits: json['totalHits'] as int,
    hits: (json['hits'] as List)
        ?.map(
            (e) => e == null ? null : Hits.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WallpapersToJson(Wallpapers instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
