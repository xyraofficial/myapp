# XTermux - Termux Information & Setup Guide

Android aplikasi yang menyediakan informasi lengkap tentang Termux, daftar sumber paket, dan panduan setup untuk pengguna Termux terminal emulator.

## Fitur Utama

### 1. Termux Info
- Informasi lengkap tentang Termux terminal emulator
- Fitur-fitur utama dan kemampuan
- Persyaratan sistem
- Use case dan manfaat
- Link ke sumber resmi

### 2. Package Sources
- Daftar repository resmi Termux
- Sumber community dan third-party
- URL repository dengan fungsi copy
- Perintah package manager
- Instruksi menambah custom repository

### 3. Setup Guide
- Panduan instalasi step-by-step
- Konfigurasi awal
- Perintah-perintah esensial untuk pemula
- Troubleshooting tips
- Tips dan trik pro

## Teknologi

- **Framework**: Flutter 3.x
- **Language**: Dart
- **UI**: Material Design 3
- **Fonts**: Google Fonts (Roboto, Montserrat)
- **State Management**: Provider
- **Platform Target**: Android & Web

## Cara Menjalankan

### Prasyarat
- Flutter SDK 3.9.0 atau lebih baru
- Android SDK (untuk build Android)
- Editor: Android Studio / VS Code

### Install Dependencies
```bash
flutter pub get
```

### Run di Android Emulator/Device
```bash
flutter run
```

### Build APK
```bash
flutter build apk --release
```

APK akan tersedia di: `build/app/outputs/flutter-apk/app-release.apk`

### Build App Bundle (untuk Google Play)
```bash
flutter build appbundle --release
```

## Struktur Project

```
lib/
├── main.dart                 # Entry point & theme setup
├── providers/
│   └── theme_provider.dart   # Theme management
└── screens/
    ├── home_screen.dart           # Termux info page
    ├── package_sources_screen.dart # Package sources page
    └── setup_guide_screen.dart     # Setup guide page
```

## Fitur UI/UX

- Material Design 3 dengan color scheme hijau modern
- Dark mode dan Light mode support
- Bottom navigation untuk navigasi mudah
- Card-based layout untuk konten yang terorganisir
- Copy-to-clipboard untuk commands dan URLs
- Responsive design untuk berbagai ukuran layar
- Typography yang jelas dengan Google Fonts

## Screenshot

Aplikasi ini memiliki 3 halaman utama:
1. **Termux Info** - Informasi komprehensif tentang Termux
2. **Package Sources** - Daftar repository dan perintah package manager
3. **Setup Guide** - Panduan setup lengkap dengan troubleshooting

## Lisensi

Project ini dibuat untuk tujuan edukasi.

## Kontribusi

Ini adalah project Flutter standalone untuk memberikan informasi tentang Termux.
Untuk informasi lebih lanjut tentang Termux itu sendiri, kunjungi:
- GitHub: https://github.com/termux/termux-app
- Wiki: https://wiki.termux.com
