import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  Song? _currentSong;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isShuffled = false;
  bool _isRepeated = false;
  List<Song> _playlist = [];
  int _currentIndex = 0;

  // Getters
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  bool get isShuffled => _isShuffled;
  bool get isRepeated => _isRepeated;
  List<Song> get playlist => _playlist;
  int get currentIndex => _currentIndex;

  AudioProvider() {
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _audioPlayer.playerStateStream.listen((state) {
      _isPlaying = state.playing;
      notifyListeners();
    });

    _audioPlayer.positionStream.listen((pos) {
      _position = pos;
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((dur) {
      _duration = dur ?? Duration.zero;
      notifyListeners();
    });

    _audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        if (_isRepeated) {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.play();
        } else {
          _next();
        }
      }
    });
  }

  Future<void> playSong(Song song, {List<Song>? playlist, int? index}) async {
    try {
      if (playlist != null) {
        _playlist = playlist;
        _currentIndex = index ?? 0;
      }

      _currentSong = song;
      
      if (song.audioUrl != null) {
        await _audioPlayer.setUrl(song.audioUrl!);
        await _audioPlayer.play();
      }
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error playing song: $e');
    }
  }

  Future<void> play() async {
    try {
      await _audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error playing: $e');
    }
  }

  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error pausing: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
      _isPlaying = false;
      _position = Duration.zero;
      notifyListeners();
    } catch (e) {
      debugPrint('Error stopping: $e');
    }
  }

  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      debugPrint('Error seeking: $e');
    }
  }

  void _next() {
    if (_playlist.isNotEmpty && _currentIndex < _playlist.length - 1) {
      _currentIndex++;
      playSong(_playlist[_currentIndex]);
    }
  }

  void _previous() {
    if (_playlist.isNotEmpty && _currentIndex > 0) {
      _currentIndex--;
      playSong(_playlist[_currentIndex]);
    }
  }

  void next() {
    _next();
  }

  void previous() {
    _previous();
  }

  void toggleShuffle() {
    _isShuffled = !_isShuffled;
    if (_isShuffled) {
      _playlist.shuffle();
    }
    notifyListeners();
  }

  void toggleRepeat() {
    _isRepeated = !_isRepeated;
    notifyListeners();
  }

  void toggleLike() {
    if (_currentSong != null) {
      _currentSong = _currentSong!.copyWith(isLiked: !_currentSong!.isLiked);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
