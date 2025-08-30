@echo off
echo Setting up Flutter build environment...

REM Check if Flutter is installed
flutter --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter and add it to your PATH
    echo Download from: https://flutter.dev/docs/get-started/install/windows
    pause
    exit /b 1
)

echo Flutter found! Running pub get...
flutter pub get

echo.
echo Checking Flutter doctor...
flutter doctor

echo.
echo Setup complete! You can now try to build:
echo   flutter build apk --debug    (for Android)
echo   flutter build ios --debug    (for iOS - requires macOS)
echo   flutter run                  (to run on connected device)

pause
