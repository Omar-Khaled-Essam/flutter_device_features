import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/app_constants.dart';

/// Phase 3: full-screen Google Map with a red marker on Cairo.
class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cairoMarker = Marker(
      markerId: const MarkerId('cairo'),
      position: AppConstants.cairoLocation,
      infoWindow: const InfoWindow(title: 'Cairo Governorate'),
      // Hue red makes the marker explicitly red on every platform.
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Google Map')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: AppConstants.cairoLocation,
          zoom: 10,
        ),
        markers: {cairoMarker},
      ),
    );
  }
}
