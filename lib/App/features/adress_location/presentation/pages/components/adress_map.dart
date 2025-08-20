import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class AdressMap extends StatefulWidget {
  const AdressMap({
    super.key,
    this.height = 220,
    this.borderRadius = 16,
    this.defaultCenter = const LatLng(5.34, -4.02), // Abidjan par défaut
    this.defaultZoom = 12.0,
  });

  final double height;
  final double borderRadius;
  final LatLng defaultCenter;
  final double defaultZoom;

  @override
  State<AdressMap> createState() => _AdressMapState();
}

class _AdressMapState extends State<AdressMap> {
  final MapController _map = MapController();

  @override
  Widget build(BuildContext context) {
    final borderColor = CupertinoColors.systemGrey4.resolveFrom(context);

    return BlocConsumer<KycDocCubit, KycDocState>(
      listenWhen:
          (p, c) =>
              p.addressLat != c.addressLat || p.addressLon != c.addressLon,
      listener: (context, s) {
        final lat = s.addressLat, lon = s.addressLon;
        if (lat != null && lon != null) {
          _map.move(
            LatLng(lat, lon),
            16.0,
          ); // recentre sur la nouvelle position
        }
      },
      buildWhen:
          (p, c) =>
              p.addressLat != c.addressLat || p.addressLon != c.addressLon,
      builder: (context, state) {
        final hasPoint = state.addressLat != null && state.addressLon != null;
        final center =
            hasPoint
                ? LatLng(state.addressLat!, state.addressLon!)
                : widget.defaultCenter;

        final markers = <Marker>[
          if (hasPoint)
            Marker(
              width: 44,
              height: 44,
              point: center,
              child: const Icon(
                FontAwesomeIcons.locationDot,
                size: 40,
                color: AppTheme.kPrimary,
              ),
              rotate: false,
            ),
        ];

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: widget.height,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(color: borderColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius - 8),
                child: FlutterMap(
                  mapController: _map,
                  options: MapOptions(
                    initialCenter: center,
                    initialZoom: hasPoint ? 15.5 : widget.defaultZoom,
                    interactionOptions: const InteractionOptions(
                      flags:
                          InteractiveFlag.pinchZoom |
                          InteractiveFlag.drag |
                          InteractiveFlag.doubleTapZoom,
                    ),
                  ),
                  children: [
                    // Tiles claires haute résolution (Carto Positron)
                    TileLayer(
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                      subdomains: const ['a', 'b', 'c', 'd'],
                      retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
                      userAgentPackageName:
                          'com.example.push_kyc', // adapte au tien
                      maxZoom: 19,
                      tileProvider: NetworkTileProvider(),
                      // Attribution légale
                      additionalOptions: const {},
                    ),
                    MarkerLayer(markers: markers),

                    // Attribution (obligatoire)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: Text(
                              '© OpenStreetMap • © CARTO',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Bandeau coordonné + libellé (si dispo)
                    if (hasPoint)
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: _CoordBadge(
                          name: state.addressName,
                          lat: state.addressLat!,
                          lon: state.addressLon!,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Petit marqueur “pin” simple et lisible
class _Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // halo
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: CupertinoColors.activeBlue.withOpacity(0.25),
            shape: BoxShape.circle,
          ),
        ),
        // dot
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: CupertinoColors.activeBlue,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class _CoordBadge extends StatelessWidget {
  const _CoordBadge({this.name, required this.lat, required this.lon});
  final String? name;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground
            .resolveFrom(context)
            .withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: CupertinoColors.systemGrey4.resolveFrom(context),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          [
            if (name != null && name!.trim().isNotEmpty) name,
            '${lat.toStringAsFixed(5)}, ${lon.toStringAsFixed(5)}',
          ].whereType<String>().join(' · '),
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
