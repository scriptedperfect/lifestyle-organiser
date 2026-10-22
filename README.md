# Lifestyle Organiser

A password-locked Android app for work and personal to-dos, loans and savings/investments.
All data is encrypted on the phone with your password (PBKDF2 + AES-256-GCM). Nothing is sent online.

## Get the APK
Every push to `main` builds the app on GitHub. Open the **Releases** page of this repository and download
`LifestyleOrganiser.apk` from the newest release. On your phone, allow installs from your browser or file manager when asked.

## Change the app
Edit `www/app.html`, commit to `main`, and a new APK appears on the Releases page a few minutes later.

## Important
- There is no password recovery. Use Settings → Backup to copy an encrypted backup code and keep it safe.
- Uninstalling the app deletes its data. Make a backup first.
