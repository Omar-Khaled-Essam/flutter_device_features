import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// Wraps local_auth to authenticate the user with a fingerprint.
class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Returns true only if the user successfully authenticates.
  Future<bool> authenticateWithFingerprint() async {
    try {
      final isSupported = await _localAuth.isDeviceSupported();
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (!isSupported || !canCheckBiometrics) return false;

      return await _localAuth.authenticate(
        localizedReason: 'Scan your fingerprint to open your profile',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}
