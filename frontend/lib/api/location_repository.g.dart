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

_$_EveryonesLocations _$$_EveryonesLocationsFromJson(
        Map<String, dynamic> json) =>
    _$_EveryonesLocations(
      results: (json['results'] as List<dynamic>)
          .map((e) => NameAndLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EveryonesLocationsToJson(
        _$_EveryonesLocations instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
