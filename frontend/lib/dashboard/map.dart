import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/api/location_repository.dart';
import 'package:frontend/api/name_repository.dart';
import 'package:frontend/ui-library/jh_circle_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MapPage extends ConsumerStatefulWidget {
  final defaultZoom = 14.0;
  final markerSize = 50.0;
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  final _map = MapController();

  @override
  void dispose() {
    _map.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);

    final everyonesLocations = ref.watch(everyonesLocationsProvider);
    final apiId = ref.watch(apiIdProvider);

    return location.when(
      data: (location) => Stack(
        children: [
          FlutterMap(
            mapController: _map,
            options: MapOptions(
              center: LatLng(location.latitude, location.longitude),
              zoom: widget.defaultZoom,
              maxZoom: 18,
              minZoom: 12,
            ),
            nonRotatedChildren: [
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  ...everyonesLocations.when(
                    data: (everyonesLocations) => [
                      for (final person in everyonesLocations
                          .where((element) => element.apiId != apiId.value))
                        jhMarker(
                          lat: person.lat,
                          lng: person.lng,
                          size: widget.markerSize,
                          color: Colors.orange,
                        ),
                    ],
                    loading: () => [],
                    error: (error, stackTrace) => [],
                  ),
                  jhMarker(
                    lat: location.latitude,
                    lng: location.longitude,
                    size: widget.markerSize,
                    color: Colors.deepPurple,
                  ),
                ],
              )
            ],
          ),
          Positioned(
            top: 24,
            bottom: 48,
            right: 10,
            child: Column(
              children: [
                JHCircleButton(
                  onTap: () {
                    ref.invalidate(everyonesLocationsProvider);
                    ref.invalidate(locationProvider);
                  },
                  child: const Icon(Icons.refresh),
                ),
                Expanded(
                  child: Container(),
                ),
                JHCircleButton(
                  onTap: () {
                    _map.moveAndRotate(
                      LatLng(location.latitude, location.longitude),
                      widget.defaultZoom,
                      0,
                    );
                  },
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),
        ],
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

Marker jhMarker({
  required double lat,
  required double lng,
  required double size,
  required Color color,
}) {
  return Marker(
    point: LatLng(
      lat,
      lng,
    ),
    anchorPos: AnchorPos.align(AnchorAlign.center),
    width: size,
    height: size * 2,
    builder: (context) => Align(
      alignment: Alignment.topCenter,
      child: Icon(
        Icons.location_on,
        color: color,
        size: size,
      ),
    ),
  );
}
