#!/bin/bash
# Run once after `flutter create .`
# Switches MainActivity to FlutterFragmentActivity (required by local_auth).
# Optional: pass your Maps key to fill it into the manifest automatically.
# Usage: ./setup_platforms.sh [YOUR_GOOGLE_MAPS_API_KEY]
set -e

ACTIVITY=$(find android/app/src/main -name MainActivity.kt | head -n 1)
sed -i 's/FlutterActivity/FlutterFragmentActivity/g' "$ACTIVITY"

if [ -n "$1" ]; then
  sed -i "s/YOUR_GOOGLE_MAPS_API_KEY/$1/" android/app/src/main/AndroidManifest.xml
  echo "Maps API key written to AndroidManifest.xml"
fi
echo "Done."
