@echo off
echo Building Android APK...
echo.

REM Check if Flutter is available
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Flutter not found in PATH
    echo Please run find_flutter.bat first to set the correct Flutter SDK path
    pause
    exit /b 1
)

echo Flutter found! Building Android APK...
echo.

REM Clean and get dependencies
echo Step 1: Getting Flutter dependencies...
flutter pub get
if errorlevel 1 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Building Android APK...
flutter build apk --debug
if errorlevel 1 (
    echo ERROR: Build failed
    echo.
    echo Common solutions:
    echo 1. Make sure you have Java JDK 8+ installed
    echo 2. Set JAVA_HOME environment variable
    echo 3. Check that Flutter SDK path is correct in android/local.properties
    echo.
    pause
    exit /b 1
)

echo.
echo SUCCESS! Android APK built successfully.
echo You can find the APK at: build/app/outputs/flutter-apk/app-debug.apk
echo.
pause
