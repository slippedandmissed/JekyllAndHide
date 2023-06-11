// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NameAndLocation _$$_NameAndLocationFromJson(Map<String, dynamic> json) =>
    _$_NameAndLocation(
      name: json['name'] as String,
      apiId: json['apiId'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_NameAndLocationToJson(_$_NameAndLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'apiId': instance.apiId,
      'lat': instance.lat,
      'lng': instance.lng,
    };
