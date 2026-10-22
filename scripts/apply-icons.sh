#!/usr/bin/env bash
# Replaces Capacitor's default launcher icons with the purple Lifestyle Organiser icon.
set -euo pipefail
RES=android/app/src/main/res
rm -rf "$RES/mipmap-anydpi-v26"
for d in mdpi hdpi xhdpi xxhdpi xxxhdpi; do
  cp "icons/ic_launcher-$d.png" "$RES/mipmap-$d/ic_launcher.png"
  cp "icons/ic_launcher_round-$d.png" "$RES/mipmap-$d/ic_launcher_round.png"
  rm -f "$RES/mipmap-$d/ic_launcher_foreground.png"
done
# Purple status/navigation bars and window background
mkdir -p "$RES/values"
cat > "$RES/values/colors.xml" <<'XML'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="colorPrimary">#fbf6ec</color>
    <color name="colorPrimaryDark">#6a3fd0</color>
    <color name="colorAccent">#6a3fd0</color>
</resources>
XML
# Microphone permission for voice commands
MANIFEST=android/app/src/main/AndroidManifest.xml
if ! grep -q RECORD_AUDIO "$MANIFEST"; then
  sed -i 's#</manifest>#    <uses-permission android:name="android.permission.RECORD_AUDIO" />\n    <queries>\n        <intent>\n            <action android:name="android.speech.RecognitionService" />\n        </intent>\n    </queries>\n</manifest>#' "$MANIFEST"
fi
grep -n "RECORD_AUDIO\|RecognitionService" "$MANIFEST"
echo "Icons, colours and permissions applied"
