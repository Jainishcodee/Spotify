import 'package:flutter/foundation.dart';
import '../models/song.dart';
import '../models/artist.dart';
import '../models/playlist.dart';
import '../models/genre.dart';

class PlaylistProvider extends ChangeNotifier {
  List<Song> _trendingSongs = [];
  List<Artist> _goodEveningArtists = [];
  List<Playlist> _recentlyPlayed = [];
  List<Playlist> _jumpBackIn = [];
  List<Genre> _genres = [];
  List<Playlist> _userPlaylists = [];
  List<Artist> _followedArtists = [];

  // Getters
  List<Song> get trendingSongs => _trendingSongs;
  List<Artist> get goodEveningArtists => _goodEveningArtists;
  List<Playlist> get recentlyPlayed => _recentlyPlayed;
  List<Playlist> get jumpBackIn => _jumpBackIn;
  List<Genre> get genres => _genres;
  List<Playlist> get userPlaylists => _userPlaylists;
  List<Artist> get followedArtists => _followedArtists;

  PlaylistProvider() {
    _loadSampleData();
  }

  void _loadSampleData() {
    _loadTrendingSongs();
    _loadGoodEveningArtists();
    _loadRecentlyPlayed();
    _loadJumpBackIn();
    _loadGenres();
    _loadUserPlaylists();
    _loadFollowedArtists();
  }

  void _loadTrendingSongs() {
    _trendingSongs = [
      Song(
        id: '1',
        title: 'Blinding Lights',
        artist: 'The Weeknd',
        album: 'After Hours',
        duration: const Duration(minutes: 3, seconds: 20),
        imageUrl: 'assets/images/blinding_lights.jpg',
        audioUrl: 'assets/audio/blinding_lights.mp3',
      ),
      Song(
        id: '2',
        title: 'Dance Monkey',
        artist: 'Tones and I',
        album: 'The Kids Are Coming',
        duration: const Duration(minutes: 3, seconds: 29),
        imageUrl: 'assets/images/dance_monkey.jpg',
        audioUrl: 'assets/audio/dance_monkey.mp3',
      ),
      Song(
        id: '3',
        title: 'Shape of You',
        artist: 'Ed Sheeran',
        album: '÷ (Divide)',
        duration: const Duration(minutes: 3, seconds: 53),
        imageUrl: 'assets/images/shape_of_you.jpg',
        audioUrl: 'assets/audio/shape_of_you.mp3',
      ),
      Song(
        id: '4',
        title: 'Uptown Funk',
        artist: 'Mark Ronson ft. Bruno Mars',
        album: 'Uptown Special',
        duration: const Duration(minutes: 4, seconds: 30),
        imageUrl: 'assets/images/uptown_funk.jpg',
        audioUrl: 'assets/audio/uptown_funk.mp3',
      ),
      Song(
        id: '5',
        title: 'Despacito',
        artist: 'Luis Fonsi ft. Daddy Yankee',
        album: 'Vida',
        duration: const Duration(minutes: 4, seconds: 41),
        imageUrl: 'assets/images/despacito.jpg',
        audioUrl: 'assets/audio/despacito.mp3',
      ),
    ];
  }

  void _loadGoodEveningArtists() {
    _goodEveningArtists = [
      Artist(
        id: '1',
        name: 'The Weeknd',
        imageUrl: 'assets/images/the_weeknd.jpg',
        monthlyListeners: 85000000,
      ),
      Artist(
        id: '2',
        name: 'Ed Sheeran',
        imageUrl: 'assets/images/ed_sheeran.jpg',
        monthlyListeners: 78000000,
      ),
      Artist(
        id: '3',
        name: 'Drake',
        imageUrl: 'assets/images/drake.jpg',
        monthlyListeners: 82000000,
      ),
      Artist(
        id: '4',
        name: 'Taylor Swift',
        imageUrl: 'assets/images/taylor_swift.jpg',
        monthlyListeners: 75000000,
      ),
      Artist(
        id: '5',
        name: 'Post Malone',
        imageUrl: 'assets/images/post_malone.jpg',
        monthlyListeners: 68000000,
      ),
      Artist(
        id: '6',
        name: 'Ariana Grande',
        imageUrl: 'assets/images/ariana_grande.jpg',
        monthlyListeners: 72000000,
      ),
    ];
  }

  void _loadRecentlyPlayed() {
    _recentlyPlayed = [
      Playlist(
        id: '1',
        name: 'Today\'s Top Hits',
        description: 'The hottest tracks right now',
        imageUrl: 'assets/images/todays_top_hits.jpg',
        songCount: 50,
      ),
      Playlist(
        id: '2',
        name: 'RapCaviar',
        description: 'New music from Drake, Kendrick Lamar and more',
        imageUrl: 'assets/images/rapcaviar.jpg',
        songCount: 45,
      ),
      Playlist(
        id: '3',
        name: 'All Out 2010s',
        description: 'The biggest songs of the 2010s',
        imageUrl: 'assets/images/all_out_2010s.jpg',
        songCount: 100,
      ),
      Playlist(
        id: '4',
        name: 'Rock Classics',
        description: 'Rock legends & epic songs',
        imageUrl: 'assets/images/rock_classics.jpg',
        songCount: 75,
      ),
    ];
  }

  void _loadJumpBackIn() {
    _jumpBackIn = [
      Playlist(
        id: '5',
        name: 'Liked Songs',
        description: 'Your liked songs',
        imageUrl: 'assets/images/liked_songs.jpg',
        songCount: 234,
      ),
      Playlist(
        id: '6',
        name: 'Discover Weekly',
        description: 'Your weekly mixtape of fresh music',
        imageUrl: 'assets/images/discover_weekly.jpg',
        songCount: 30,
      ),
      Playlist(
        id: '7',
        name: 'Release Radar',
        description: 'Catch all the latest music from artists you follow',
        imageUrl: 'assets/images/release_radar.jpg',
        songCount: 25,
      ),
    ];
  }

  void _loadGenres() {
    _genres = [
      Genre(
        id: '1',
        name: 'Pop',
        color: const Color(0xFFE91E63),
        imageUrl: 'assets/images/pop.jpg',
      ),
      Genre(
        id: '2',
        name: 'Hip-Hop',
        color: const Color(0xFF9C27B0),
        imageUrl: 'assets/images/hip_hop.jpg',
      ),
      Genre(
        id: '3',
        name: 'Rock',
        color: const Color(0xFFF44336),
        imageUrl: 'assets/images/rock.jpg',
      ),
      Genre(
        id: '4',
        name: 'Electronic',
        color: const Color(0xFF2196F3),
        imageUrl: 'assets/images/electronic.jpg',
      ),
      Genre(
        id: '5',
        name: 'R&B',
        color: const Color(0xFF3F51B5),
        imageUrl: 'assets/images/rnb.jpg',
      ),
      Genre(
        id: '6',
        name: 'Country',
        color: const Color(0xFF4CAF50),
        imageUrl: 'assets/images/country.jpg',
      ),
      Genre(
        id: '7',
        name: 'Jazz',
        color: const Color(0xFFFF9800),
        imageUrl: 'assets/images/jazz.jpg',
      ),
      Genre(
        id: '8',
        name: 'Classical',
        color: const Color(0xFF795548),
        imageUrl: 'assets/images/classical.jpg',
      ),
    ];
  }

  void _loadUserPlaylists() {
    _userPlaylists = [
      Playlist(
        id: '8',
        name: 'My Playlist #1',
        description: 'Created by you',
        imageUrl: 'assets/images/my_playlist_1.jpg',
        songCount: 15,
      ),
      Playlist(
        id: '9',
        name: 'Workout Mix',
        description: 'Created by you',
        imageUrl: 'assets/images/workout_mix.jpg',
        songCount: 28,
      ),
      Playlist(
        id: '10',
        name: 'Chill Vibes',
        description: 'Created by you',
        imageUrl: 'assets/images/chill_vibes.jpg',
        songCount: 42,
      ),
    ];
  }

  void _loadFollowedArtists() {
    _followedArtists = [
      Artist(
        id: '7',
        name: 'Billie Eilish',
        imageUrl: 'assets/images/billie_eilish.jpg',
        monthlyListeners: 65000000,
        isFollowed: true,
      ),
      Artist(
        id: '8',
        name: 'Dua Lipa',
        imageUrl: 'assets/images/dua_lipa.jpg',
        monthlyListeners: 58000000,
        isFollowed: true,
      ),
      Artist(
        id: '9',
        name: 'The Chainsmokers',
        imageUrl: 'assets/images/the_chainsmokers.jpg',
        monthlyListeners: 45000000,
        isFollowed: true,
      ),
    ];
  }

  void toggleLikeSong(String songId) {
    final index = _trendingSongs.indexWhere((song) => song.id == songId);
    if (index != -1) {
      _trendingSongs[index] = _trendingSongs[index].copyWith(
        isLiked: !_trendingSongs[index].isLiked,
      );
      notifyListeners();
    }
  }

  void toggleFollowArtist(String artistId) {
    final index = _goodEveningArtists.indexWhere((artist) => artist.id == artistId);
    if (index != -1) {
      _goodEveningArtists[index] = _goodEveningArtists[index].copyWith(
        isFollowed: !_goodEveningArtists[index].isFollowed,
      );
      notifyListeners();
    }
  }

  void toggleLikePlaylist(String playlistId) {
    final index = _recentlyPlayed.indexWhere((playlist) => playlist.id == playlistId);
    if (index != -1) {
      _recentlyPlayed[index] = _recentlyPlayed[index].copyWith(
        isLiked: !_recentlyPlayed[index].isLiked,
      );
      notifyListeners();
    }
  }
}
