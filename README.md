# Spotify Clone Flutter App

A beautiful and feature-rich Spotify clone built with Flutter, featuring a modern UI design and smooth animations that closely resembles the original Spotify app.

## 🎵 Features

### Core Features
- **Home Screen**: Personalized music recommendations with "Good Evening" artists, recently played playlists, and trending songs
- **Search Screen**: Browse music by genres with a beautiful grid layout
- **Library Screen**: Manage your playlists and followed artists with tabbed navigation
- **Premium Screen**: Subscription plans with feature comparison
- **Music Player**: Full-featured player with controls, progress bar, and album art display

### UI/UX Features
- **Material Design 3**: Modern design system with Spotify's brand colors
- **Dark Theme**: Beautiful dark theme optimized for music apps
- **Smooth Animations**: Fluid transitions and micro-interactions
- **Responsive Design**: Works perfectly on different screen sizes
- **Custom Navigation**: Bottom navigation with smooth page transitions

### Audio Features
- **Music Playback**: Full audio player with play/pause, skip, and seek functionality
- **Playlist Management**: Create and manage playlists
- **Like/Unlike**: Save your favorite songs and playlists
- **Shuffle & Repeat**: Advanced playback controls
- **Background Playback**: Continue listening while using other apps

## 🛠 Technical Stack

### Core Technologies
- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **Provider**: State management
- **Go Router**: Navigation and routing

### Audio & Media
- **just_audio**: Audio playback engine
- **audio_session**: Audio session management
- **cached_network_image**: Image loading and caching

### UI Components
- **shimmer**: Loading effects
- **lottie**: Animations
- **Material Design 3**: UI components

### Storage & Data
- **shared_preferences**: Local preferences storage
- **sqflite**: Local database (ready for implementation)
- **http**: Network requests

## 📱 Screenshots

The app includes the following main screens:

1. **Home Screen**: Personalized music feed
2. **Search Screen**: Genre-based browsing
3. **Library Screen**: User's music collection
4. **Premium Screen**: Subscription options
5. **Player Screen**: Full-screen music player

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd spotify_clone_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── song.dart
│   ├── artist.dart
│   ├── playlist.dart
│   └── genre.dart
├── providers/                # State management
│   ├── audio_provider.dart
│   ├── playlist_provider.dart
│   └── user_provider.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── library_screen.dart
│   ├── premium_screen.dart
│   └── player_screen.dart
├── widgets/                  # Reusable widgets
│   ├── good_evening_grid.dart
│   ├── recently_played_list.dart
│   ├── jump_back_in_list.dart
│   ├── genre_grid.dart
│   └── library_list.dart
└── utils/                    # Utilities
    └── theme.dart
```

## 🎨 Customization

### Adding Your Music

1. **Place MP3 files** in the `assets/audio/` directory
2. **Add album art** in the `assets/images/` directory
3. **Update the PlaylistProvider** to include your songs:

```dart
void _loadTrendingSongs() {
  _trendingSongs = [
    Song(
      id: '1',
      title: 'Your Song Title',
      artist: 'Your Artist',
      album: 'Your Album',
      duration: const Duration(minutes: 3, seconds: 30),
      imageUrl: 'assets/images/your_album_art.jpg',
      audioUrl: 'assets/audio/your_song.mp3',
    ),
    // Add more songs...
  ];
}
```

### Customizing Colors

Edit `lib/utils/theme.dart` to customize the app's color scheme:

```dart
class AppTheme {
  static const Color spotifyGreen = Color(0xFF1DB954);
  static const Color spotifyBlack = Color(0xFF191414);
  // Add your custom colors...
}
```

### Adding New Features

The app is built with a modular architecture, making it easy to add new features:

1. **New Screens**: Add to `lib/screens/`
2. **New Widgets**: Add to `lib/widgets/`
3. **New Models**: Add to `lib/models/`
4. **New Providers**: Add to `lib/providers/`

## 📦 Dependencies

### Core Dependencies
```yaml
flutter:
  sdk: flutter
provider: ^6.1.1
go_router: ^12.1.3
just_audio: ^0.9.36
cached_network_image: ^3.3.0
```

### UI Dependencies
```yaml
shimmer: ^3.0.0
lottie: ^2.7.0
cupertino_icons: ^1.0.2
```

### Storage Dependencies
```yaml
shared_preferences: ^2.2.2
sqflite: ^2.3.0
http: ^1.1.0
```

## 🔧 Configuration

### Android Configuration

Add the following permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
```

### iOS Configuration

Add the following to `ios/Runner/Info.plist`:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
</array>
```

## 🎯 Key Features Implementation

### State Management
The app uses Provider pattern for state management:
- **AudioProvider**: Manages music playback state
- **PlaylistProvider**: Manages music data and playlists
- **UserProvider**: Manages user preferences and settings

### Navigation
Uses Go Router for declarative routing with:
- Bottom navigation for main screens
- Modal navigation for the player
- Deep linking support

### Audio Playback
Implements full audio functionality with:
- Background playback
- Audio session management
- Playlist support
- Shuffle and repeat modes

## 🚀 Future Enhancements

### Planned Features
- [ ] User authentication
- [ ] Real-time music streaming
- [ ] Social features (sharing, following)
- [ ] Offline downloads
- [ ] Voice commands
- [ ] Equalizer
- [ ] Sleep timer
- [ ] Crossfade settings

### Technical Improvements
- [ ] Database integration (SQLite)
- [ ] API integration
- [ ] Push notifications
- [ ] Analytics
- [ ] Crash reporting
- [ ] Unit and widget tests

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Spotify for the inspiration and design
- Flutter team for the amazing framework
- All the package authors for their contributions

## 📞 Support

If you have any questions or need help with the project:

1. Check the [Issues](../../issues) page
2. Create a new issue with detailed information
3. Contact the maintainers

---

**Note**: This is a demo project for educational purposes. It's not affiliated with Spotify and doesn't use real Spotify APIs or content.
