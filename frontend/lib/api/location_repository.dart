import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/api/api.dart';
import 'package:geolocator/geolocator.dart';

part 'location_repository.freezed.dart';
part 'location_repository.g.dart';

@freezed
class NameAndLocation with _$NameAndLocation {
  const factory NameAndLocation({
    required String name,
    required String apiId,
    required double lat,
    required double lng,
  }) = _NameAndLocation;

  factory NameAndLocation.fromJson(Map<String, Object?> json) =>
      _$NameAndLocationFromJson(json);
}

class LocationRepository {
  final Api api;

  const LocationRepository({required this.api});

  Future<void> setLocation(Position location) async {
    await api.post(
      path: "/my-location",
      data: {"lat": location.latitude + 0.01, "lng": location.longitude},
    );
  }

  Future<List<NameAndLocation>> everyonesLocations() async {
    final response = await api.get(path: "/everyones-locations", data: {});
    final results = response["results"] as List<dynamic>;
    return results.map((e) => NameAndLocation.fromJson(e)).toList();
  }
}

final locationRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiProvider);
  return LocationRepository(api: api);
});

final everyonesLocationsProvider = StreamProvider((ref) {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return Stream.periodic(
    const Duration(seconds: 2),
  ).asyncMap(
    (i) => locationRepository.everyonesLocations(),
  );
});
