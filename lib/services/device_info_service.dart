import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

/// Reads the device model and OS version using device_info_plus.
class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> getModelAndOsVersion() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return 'Model: ${androidInfo.model}\n'
          'Android ${androidInfo.version.release} '
          '(SDK ${androidInfo.version.sdkInt})';
    }
    if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return 'Model: ${iosInfo.model}\n'
          '${iosInfo.systemName} ${iosInfo.systemVersion}';
    }
    return 'Unsupported platform';
  }
}
