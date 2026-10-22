import 'package:flutter/material.dart';

import '../widgets/feature_menu_tile.dart';
import 'audio_recorder_screen.dart';
import 'device_info_screen.dart';
import 'google_map_screen.dart';
import 'image_gallery_screen.dart';
import 'shopping_home_screen.dart';

/// Entry screen listing every phase of the project.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Features')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FeatureMenuTile(
            icon: Icons.phone_android,
            title: 'Phase 1 — Device Info',
            destination: DeviceInfoScreen(),
          ),
          FeatureMenuTile(
            icon: Icons.photo_library,
            title: 'Phase 2 — Image Gallery',
            destination: ImageGalleryScreen(),
          ),
          FeatureMenuTile(
            icon: Icons.map,
            title: 'Phase 3 — Google Map',
            destination: GoogleMapScreen(),
          ),
          FeatureMenuTile(
            icon: Icons.fingerprint,
            title: 'Phase 4 — Shopping (Biometric Profile)',
            destination: ShoppingHomeScreen(),
          ),
          FeatureMenuTile(
            icon: Icons.mic,
            title: 'Phase 5 — Audio Recorder',
            destination: AudioRecorderScreen(),
          ),
        ],
      ),
    );
  }
}
