import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/periodic_streams.dart';
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

@freezed
class EveryonesLocations with _$EveryonesLocations {
  const factory EveryonesLocations({required List<NameAndLocation> results}) =
      _EveryonesLocations;

  factory EveryonesLocations.fromJson(Map<String, Object?> json) =>
      _$EveryonesLocationsFromJson(json);
}

class LocationRepository {
  final HttpService _http;

  const LocationRepository({required HttpService http}) : _http = http;

  Future<void> setMyLocation(Position location) async {
    await _http.post(
      "/my-location",
      {"lat": location.latitude, "lng": location.longitude},
      (_) => null,
    );
  }

  Future<List<NameAndLocation>> getEveryonesLocations() async {
    final response = await _http.get(
      "/everyones-locations",
      {},
      EveryonesLocations.fromJson,
    );
    return response.result?.results ?? [];
  }

  Future<Position> getMyLocation() async {
    // FIXME: don't fetch location if you're not currently in a game
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentPosition = await Geolocator.getCurrentPosition();
    await setMyLocation(currentPosition);
    return currentPosition;
  }
}

final locationRepositoryProvider = Provider((ref) {
  final http = ref.watch(httpProvider);
  return LocationRepository(http: http);
});

final everyonesLocationsProvider = StreamProvider((ref) {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return periodicStream(
    const Duration(minutes: 10),
  ).asyncMap(
    (i) => locationRepository.getEveryonesLocations(),
  );
});

final locationProvider = StreamProvider<Position>((ref) {
  final locationRepository = ref.watch(locationRepositoryProvider);
  return periodicStream(
    const Duration(minutes: 10),
  ).asyncMap(
    (i) => locationRepository.getMyLocation(),
  );
});
