import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/api/location_repository.dart';
import 'package:frontend/api/name_repository.dart';
import 'package:frontend/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);
    ref.read(nameRepositoryProvider).setName("Jeff2");

    final everyonesLocations = ref.watch(everyonesLocationsProvider);
    final apiId = ref.watch(apiIdProvider);

    return location.when(
      data: (location) => FlutterMap(
        options: MapOptions(
          center: LatLng(location.latitude, location.longitude),
          zoom: 14,
          maxZoom: 18,
          minZoom: 12,
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
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
                    Marker(
                      point: LatLng(person.lat, person.lng),
                      width: 50,
                      height: 100,
                      builder: (context) => const Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.location_on,
                          size: 50,
                          color: Colors.orange,
                        ),
                      ),
                    )
                ],
                loading: () => [],
                error: (error, stackTrace) => [],
              ),
              Marker(
                point: LatLng(location.latitude, location.longitude),
                width: 50,
                height: 100,
                builder: (context) => const Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.location_on,
                    size: 50,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
