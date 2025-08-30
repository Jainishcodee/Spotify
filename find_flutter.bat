@echo off
echo Searching for Flutter SDK...
echo.

REM Check common Flutter installation locations
set FLUTTER_PATHS=C:\flutter;C:\src\flutter;C:\Users\%USERNAME%\flutter;C:\Program Files\flutter;C:\Program Files (x86)\flutter

for %%p in (%FLUTTER_PATHS%) do (
    if exist "%%p\bin\flutter.bat" (
        echo Found Flutter at: %%p
        echo.
        echo Please update android/local.properties with:
        echo flutter.sdk=%%p
        echo.
        echo And update ios/Flutter/Generated.xcconfig with:
        echo FLUTTER_ROOT=%%p
        echo.
        goto :found
    )
)

echo Flutter not found in common locations.
echo.
echo Please manually set the correct Flutter SDK path in:
echo - android/local.properties
echo - ios/Flutter/Generated.xcconfig
echo.
echo You can find your Flutter path by running: flutter --version
echo.

:found
pause
