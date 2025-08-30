@echo off
echo Fixing Gradle wrapper issues...
echo.

REM Check if we're in the right directory
if not exist "android\gradle\wrapper\gradle-wrapper.properties" (
    echo ERROR: Please run this script from the project root directory
    echo (where android/ folder is located)
    pause
    exit /b 1
)

echo Step 1: Removing broken Gradle wrapper files...
if exist "android\gradlew" del "android\gradlew"
if exist "android\gradlew.bat" del "android\gradlew.bat"
if exist "android\gradle\wrapper\gradle-wrapper.jar" del "android\gradle\wrapper\gradle-wrapper.jar"

echo Step 2: Downloading proper Gradle wrapper...
cd android

REM Try to use Flutter to regenerate Gradle wrapper
echo Trying to regenerate Gradle wrapper with Flutter...
flutter build apk --debug >nul 2>&1

if errorlevel 1 (
    echo Flutter build failed, trying manual Gradle wrapper download...
    
    REM Download gradle-wrapper.jar
    echo Downloading gradle-wrapper.jar...
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/gradle/gradle/raw/v7.5.0/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar'"
    
    REM Download gradlew
    echo Downloading gradlew...
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/gradle/gradle/raw/v7.5.0/gradle/wrapper/gradlew' -OutFile 'gradlew'"
    
    REM Download gradlew.bat
    echo Downloading gradlew.bat...
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/gradle/gradle/raw/v7.5.0/gradle/wrapper/gradlew.bat' -OutFile 'gradlew.bat'"
    
    REM Make gradlew executable (if on Unix-like system)
    if exist "gradlew" (
        echo Making gradlew executable...
        powershell -Command "icacls gradlew /grant Everyone:F"
    )
) else (
    echo Gradle wrapper regenerated successfully!
)

cd ..

echo.
echo Gradle wrapper fix complete!
echo.
echo Now try building again with:
echo   build_android.bat
echo.
pause
