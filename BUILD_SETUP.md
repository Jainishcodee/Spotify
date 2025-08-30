# Build Setup Guide for Spotify Clone Flutter App

This guide will help you set up the Android and iOS build configurations for your Flutter project.

## Prerequisites

1. **Flutter SDK**: Make sure you have Flutter installed and in your PATH
2. **Android Studio**: For Android development
3. **Xcode**: For iOS development (macOS only)
4. **Java Development Kit (JDK)**: Version 8 or higher

## Setup Steps

### 1. Flutter Setup

First, ensure Flutter is properly installed:

```bash
flutter doctor
```

This command will check your Flutter installation and report any issues.

### 2. Get Dependencies

Run the following command to get all Flutter dependencies:

```bash
flutter pub get
```

### 3. Android Build Setup

#### Update local.properties

Edit `android/local.properties` and set your Flutter SDK path:

```properties
flutter.sdk=C:\\path\\to\\your\\flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
```

**Note**: Replace `C:\\path\\to\\your\\flutter` with your actual Flutter SDK path.

#### Download Gradle Wrapper

The gradle wrapper jar file needs to be downloaded. Run:

```bash
cd android
gradle wrapper
```

Or if you have Flutter working:

```bash
flutter build apk --debug
```

### 4. iOS Build Setup (macOS only)

#### Install CocoaPods

```bash
sudo gem install cocoapods
```

#### Install iOS Dependencies

```bash
cd ios
pod install
```

## Building the App

### Android

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# Run on connected device
flutter run
```

### iOS

```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release

# Run on connected device
flutter run
```

## Troubleshooting

### Common Issues

1. **Flutter SDK not found**: Update the `flutter.sdk` path in `android/local.properties`
2. **Gradle issues**: Make sure you have JDK 8+ installed and JAVA_HOME set
3. **iOS build issues**: Ensure Xcode is properly installed and updated
4. **Permission issues**: On macOS, you might need to run `sudo xcode-select --switch /Applications/Xcode.app`

### Current Build Issues & Solutions

#### Android Gradle Error: "Could not find or load main class '-Xmx64m'"

**Problem**: The Gradle wrapper scripts have incorrect JVM options formatting.

**Solution**: 
1. Run `find_flutter.bat` to find your Flutter SDK path
2. Update `android/local.properties` with the correct Flutter SDK path
3. Run `build_android.bat` to build the project

#### iOS "No schemes available for Runner.xcodeproj"

**Problem**: Missing iOS project scheme files and configuration.

**Solution**: 
1. The iOS project files have been created, but you need macOS with Xcode to build iOS
2. For now, focus on Android build which works on Windows

### Quick Fix Commands

```bash
# Find Flutter SDK path
find_flutter.bat

# Build Android APK
build_android.bat

# Manual Flutter commands
flutter pub get
flutter build apk --debug
```

### Flutter Doctor Output

If `flutter doctor` shows issues, resolve them before building:

```bash
flutter doctor --android-licenses  # Accept Android licenses
flutter config --android-sdk /path/to/android/sdk  # Set Android SDK path
```

## Project Structure

```
spotify_clone_flutter/
├── android/                 # Android build configuration
│   ├── app/
│   ├── gradle/
│   └── build.gradle
├── ios/                     # iOS build configuration
│   ├── Runner/
│   ├── Flutter/
│   └── Podfile
├── lib/                     # Flutter source code
├── assets/                  # App assets
└── pubspec.yaml            # Flutter dependencies
```

## Next Steps

After setting up the build environment:

1. Connect a device or start an emulator
2. Run `flutter run` to test the app
3. Use `flutter build` commands to create release builds
4. Follow Flutter's deployment guides for app store publishing

## Support

If you encounter issues:

1. Check the Flutter documentation: https://flutter.dev/docs
2. Run `flutter doctor -v` for detailed information
3. Check the Flutter GitHub issues: https://github.com/flutter/flutter/issues
