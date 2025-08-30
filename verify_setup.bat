@echo off
echo ========================================
echo VERIFYING ANDROID BUILD SETUP
echo ========================================
echo.

REM Check if we're in the right directory
if not exist "android\gradle\wrapper\gradle-wrapper.properties" (
    echo ERROR: Please run this script from the project root directory
    echo (where android/ folder is located)
    pause
    exit /b 1
)

echo Checking Android build files...
echo.

REM Check essential files
set MISSING_FILES=0

echo [1/8] Checking gradle-wrapper.jar...
if exist "android\gradle\wrapper\gradle-wrapper.jar" (
    echo    ✓ gradle-wrapper.jar found
) else (
    echo    ✗ gradle-wrapper.jar MISSING
    set /a MISSING_FILES+=1
)

echo [2/8] Checking gradlew...
if exist "android\gradlew" (
    echo    ✓ gradlew found
) else (
    echo    ✗ gradlew MISSING
    set /a MISSING_FILES+=1
)

echo [3/8] Checking gradlew.bat...
if exist "android\gradlew.bat" (
    echo    ✓ gradlew.bat found
) else (
    echo    ✗ gradlew.bat MISSING
    set /a MISSING_FILES+=1
)

echo [4/8] Checking local.properties...
if exist "android\local.properties" (
    echo    ✓ local.properties found
) else (
    echo    ✗ local.properties MISSING
    set /a MISSING_FILES+=1
)

echo [5/8] Checking build.gradle files...
if exist "android\build.gradle" (
    echo    ✓ Root build.gradle found
) else (
    echo    ✗ Root build.gradle MISSING
    set /a MISSING_FILES+=1
)

if exist "android\app\build.gradle" (
    echo    ✓ App build.gradle found
) else (
    echo    ✗ App build.gradle MISSING
    set /a MISSING_FILES+=1
)

echo [6/8] Checking AndroidManifest.xml...
if exist "android\app\src\main\AndroidManifest.xml" (
    echo    ✓ AndroidManifest.xml found
) else (
    echo    ✗ AndroidManifest.xml MISSING
    set /a MISSING_FILES+=1
)

echo [7/8] Checking MainActivity.kt...
if exist "android\app\src\main\kotlin\com\example\spotify_clone_flutter\MainActivity.kt" (
    echo    ✓ MainActivity.kt found
) else (
    echo    ✗ MainActivity.kt MISSING
    set /a MISSING_FILES+=1
)

echo [8/8] Checking resource files...
if exist "android\app\src\main\res\values\styles.xml" (
    echo    ✓ styles.xml found
) else (
    echo    ✗ styles.xml MISSING
    set /a MISSING_FILES+=1
)

if exist "android\app\src\main\res\drawable\ic_launcher_background.xml" (
    echo    ✓ ic_launcher_background.xml found
) else (
    echo    ✗ ic_launcher_background.xml MISSING
    set /a MISSING_FILES+=1
)

echo.
echo ========================================
echo VERIFICATION COMPLETE
echo ========================================

if %MISSING_FILES% EQU 0 (
    echo.
    echo ✓ ALL FILES PRESENT! Android build setup is complete.
    echo.
    echo Next steps:
    echo 1. Run find_flutter.bat to set Flutter SDK path
    echo 2. Run build_android.bat to build your APK
    echo.
    echo Ready to build! 🚀
) else (
    echo.
    echo ✗ %MISSING_FILES% files are missing. Please check the setup.
    echo.
    echo Run fix_gradle.bat to fix missing files.
)

echo.
pause
