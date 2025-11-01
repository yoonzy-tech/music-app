# Music App

A cross-platform mobile application that enables users to search, browse, and preview music content from the iTunes Store. Built with Flutter, the app provides a seamless experience across iOS and Android devices.

## Features

- 🔍 **Search Music**: Search for songs, artists, and albums from the iTunes Store
- 📱 **Cross-Platform**: Works seamlessly on both iOS and Android devices
- 🎵 **Preview Tracks**: Listen to 30-second preview clips of songs
- 📊 **Track Details**: View comprehensive information including artist, album, genre, duration, and price
- 🖼️ **Album Artwork**: High-quality album artwork display
- ⚡ **Fast & Responsive**: Quick search results with smooth UI animations

## Architecture

The app follows a clean architecture pattern with clear separation of concerns:

- **Models**: Data structures for tracks and API responses
- **Services**: iTunes API integration for fetching music data
- **Screens**: UI screens for search and track details
- **Widgets**: Reusable UI components

## Project Structure

```
lib/
├── main.dart                      # App entry point
├── models/
│   └── track.dart                 # Track data model
├── services/
│   └── itunes_service.dart        # iTunes API service
├── screens/
│   ├── search_screen.dart         # Search screen UI
│   └── track_detail_screen.dart   # Track details UI
└── widgets/
    └── track_list_item.dart       # Track list item widget
```

## Dependencies

- **flutter**: Cross-platform UI framework
- **http**: HTTP client for API requests
- **cached_network_image**: Efficient image loading and caching
- **audioplayers**: Audio playback for track previews

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- iOS development: Xcode and CocoaPods
- Android development: Android Studio and Android SDK

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yoonzy-tech/music-app.git
cd music-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# Run on connected device
flutter run

# Run on specific device
flutter run -d <device_id>

# Build for release
flutter build apk      # Android
flutter build ios      # iOS
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/models/track_test.dart
```

## Usage

1. **Search for Music**: Enter a song name, artist, or album in the search bar
2. **Browse Results**: Scroll through the search results
3. **View Details**: Tap on any track to view detailed information
4. **Preview Track**: Play the 30-second preview clip on the detail screen

## API Integration

The app uses the iTunes Search API:
- **Endpoint**: `https://itunes.apple.com/search`
- **No API Key Required**: The iTunes Search API is free and doesn't require authentication
- **Rate Limiting**: Be mindful of rate limits for production use

## Platform-Specific Notes

### Android
- Minimum SDK: 21 (Android 5.0)
- Internet permission is required and already configured in AndroidManifest.xml

### iOS
- Minimum deployment target: iOS 12.0
- App Transport Security is configured to allow API requests

## Testing

The app includes unit tests for:
- Track model serialization/deserialization
- iTunes service functionality
- Data formatting utilities

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Acknowledgments

- iTunes Search API for providing free access to music data
- Flutter team for the excellent framework
- All open-source contributors whose packages made this app possible