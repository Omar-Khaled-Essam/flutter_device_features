import 'package:flutter/material.dart';

import '../services/device_info_service.dart';

/// Phase 1: shows the device model and OS version in the center.
class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Info')),
      body: Center(
        child: FutureBuilder<String>(
          future: DeviceInfoService().getModelAndOsVersion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                snapshot.data ?? 'Could not read device info',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}
