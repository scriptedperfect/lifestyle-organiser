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
    <color name="colorPrimary">#1b0f33</color>
    <color name="colorPrimaryDark">#1b0f33</color>
    <color name="colorAccent">#b993ff</color>
</resources>
XML
echo "Icons and colours applied"
