import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String _username = 'User';
  bool _isPremium = false;
  String _theme = 'dark';
  bool _explicitContent = true;
  String _audioQuality = 'high';
  bool _crossfade = false;
  int _crossfadeDuration = 0;

  // Getters
  String get username => _username;
  bool get isPremium => _isPremium;
  String get theme => _theme;
  bool get explicitContent => _explicitContent;
  String get audioQuality => _audioQuality;
  bool get crossfade => _crossfade;
  int get crossfadeDuration => _crossfadeDuration;

  UserProvider() {
    _loadUserPreferences();
  }

  Future<void> _loadUserPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _username = prefs.getString('username') ?? 'User';
      _isPremium = prefs.getBool('isPremium') ?? false;
      _theme = prefs.getString('theme') ?? 'dark';
      _explicitContent = prefs.getBool('explicitContent') ?? true;
      _audioQuality = prefs.getString('audioQuality') ?? 'high';
      _crossfade = prefs.getBool('crossfade') ?? false;
      _crossfadeDuration = prefs.getInt('crossfadeDuration') ?? 0;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading user preferences: $e');
    }
  }

  Future<void> _saveUserPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _username);
      await prefs.setBool('isPremium', _isPremium);
      await prefs.setString('theme', _theme);
      await prefs.setBool('explicitContent', _explicitContent);
      await prefs.setString('audioQuality', _audioQuality);
      await prefs.setBool('crossfade', _crossfade);
      await prefs.setInt('crossfadeDuration', _crossfadeDuration);
    } catch (e) {
      debugPrint('Error saving user preferences: $e');
    }
  }

  Future<void> setUsername(String username) async {
    _username = username;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setPremium(bool isPremium) async {
    _isPremium = isPremium;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setTheme(String theme) async {
    _theme = theme;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setExplicitContent(bool explicitContent) async {
    _explicitContent = explicitContent;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setAudioQuality(String audioQuality) async {
    _audioQuality = audioQuality;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setCrossfade(bool crossfade) async {
    _crossfade = crossfade;
    await _saveUserPreferences();
    notifyListeners();
  }

  Future<void> setCrossfadeDuration(int duration) async {
    _crossfadeDuration = duration;
    await _saveUserPreferences();
    notifyListeners();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
