# Flutter Device Features

A Flutter app that progressively integrates native device capabilities.

| Phase | Feature | Package |
|-------|---------|---------|
| 1 | Device model and OS version | `device_info_plus` |
| 2 | Multi-image gallery picker | `image_picker` |
| 3 | Google Map with red marker on Cairo | `google_maps_flutter` |
| 4 (bonus) | Fingerprint-protected profile | `local_auth` |
| 5 (bonus) | Record and play audio | `record`, `audioplayers` |

## Setup

```bash
flutter create . --platforms=android,ios   # generates the remaining native files
./setup_platforms.sh                        # makes MainActivity compatible with local_auth
flutter pub get
dart format .
flutter run
```

Add your Google Maps key in `android/app/src/main/AndroidManifest.xml` by replacing
`YOUR_GOOGLE_MAPS_API_KEY` (or run `./setup_platforms.sh YOUR_KEY`).
Enable **Maps SDK for Android** for the key in the Google Cloud Console.

## Permissions Used

### Android (`AndroidManifest.xml`)
| Permission | Used for |
|------------|----------|
| `INTERNET` | Loading map tiles and the profile image |
| `READ_MEDIA_IMAGES` (Android 13+) | Picking images from the gallery |
| `READ_EXTERNAL_STORAGE` (Android 12 and below) | Picking images from the gallery |
| `USE_BIOMETRIC` | Fingerprint authentication |
| `RECORD_AUDIO` | Recording the user's voice |
| Maps API key `meta-data` | Google Maps |

Device info (Phase 1) requires **no permission**.

`MainActivity` must extend `FlutterFragmentActivity` for `local_auth` (done by `setup_platforms.sh`).

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Pick images for the in-app gallery.</string>
<key>NSMicrophoneUsageDescription</key>
<string>Record your voice.</string>
<key>NSFaceIDUsageDescription</key>
<string>Authenticate to open your profile.</string>
```
For iOS Maps, call `GMSServices.provideAPIKey("KEY")` in `AppDelegate.swift`.

## Project Structure

```
lib/
  main.dart
  constants/app_constants.dart
  screens/      one file per screen
  widgets/      reusable widgets (one per file)
  services/     device feature integrations
```
