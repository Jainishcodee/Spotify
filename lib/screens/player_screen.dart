import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/audio_provider.dart';
import '../utils/theme.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double _currentPosition = 0.0;
  double _maxPosition = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.spotifyBlack,
      body: Consumer<AudioProvider>(
        builder: (context, audioProvider, child) {
          final currentSong = audioProvider.currentSong;
          
          if (currentSong == null) {
            return const Center(
              child: Text(
                'No song playing',
                style: TextStyle(color: AppTheme.spotifyWhite),
              ),
            );
          }

          return SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(context),
                
                // Album Art
                Expanded(
                  flex: 3,
                  child: _buildAlbumArt(currentSong),
                ),
                
                // Song Info
                Expanded(
                  flex: 2,
                  child: _buildSongInfo(context, currentSong, audioProvider),
                ),
                
                // Progress Bar
                _buildProgressBar(context, audioProvider),
                
                // Controls
                Expanded(
                  flex: 2,
                  child: _buildControls(context, audioProvider),
                ),
                
                // Bottom Actions
                _buildBottomActions(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppTheme.spotifyWhite,
              size: 32,
            ),
            onPressed: () => context.pop(),
          ),
          const Spacer(),
          Text(
            'PLAYING FROM PLAYLIST',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppTheme.spotifyLightGray,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppTheme.spotifyWhite,
            ),
            onPressed: () {
              // TODO: Show more options
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumArt(Song song) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: song.imageUrl != null
                ? Image.asset(
                    song.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppTheme.spotifyMediumGray,
                        child: const Icon(
                          Icons.music_note,
                          color: AppTheme.spotifyWhite,
                          size: 64,
                        ),
                      );
                    },
                  )
                : Container(
                    color: AppTheme.spotifyMediumGray,
                    child: const Icon(
                      Icons.music_note,
                      color: AppTheme.spotifyWhite,
                      size: 64,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildSongInfo(BuildContext context, Song song, AudioProvider audioProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Song Title
          Text(
            song.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.spotifyWhite,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Artist Name
          Text(
            song.artist,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.spotifyLightGray,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 24),
          // Like and Lyrics buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  song.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: song.isLiked ? AppTheme.spotifyGreen : AppTheme.spotifyWhite,
                ),
                onPressed: () {
                  audioProvider.toggleLike();
                },
              ),
              const SizedBox(width: 32),
              IconButton(
                icon: const Icon(
                  Icons.lyrics,
                  color: AppTheme.spotifyWhite,
                ),
                onPressed: () {
                  // TODO: Show lyrics
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context, AudioProvider audioProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          // Progress Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppTheme.spotifyGreen,
              inactiveTrackColor: AppTheme.spotifyMediumGray,
              thumbColor: AppTheme.spotifyGreen,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              trackHeight: 4,
            ),
            child: Slider(
              value: audioProvider.position.inSeconds.toDouble(),
              max: audioProvider.duration.inSeconds.toDouble(),
              onChanged: (value) {
                audioProvider.seek(Duration(seconds: value.toInt()));
              },
            ),
          ),
          // Time Labels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(audioProvider.position),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.spotifyLightGray,
                  ),
                ),
                Text(
                  _formatDuration(audioProvider.duration),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.spotifyLightGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls(BuildContext context, AudioProvider audioProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Shuffle
              IconButton(
                icon: Icon(
                  Icons.shuffle,
                  color: audioProvider.isShuffled 
                      ? AppTheme.spotifyGreen 
                      : AppTheme.spotifyWhite,
                  size: 28,
                ),
                onPressed: () {
                  audioProvider.toggleShuffle();
                },
              ),
              // Previous
              IconButton(
                icon: const Icon(
                  Icons.skip_previous,
                  color: AppTheme.spotifyWhite,
                  size: 32,
                ),
                onPressed: () {
                  audioProvider.previous();
                },
              ),
              // Play/Pause
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppTheme.spotifyGreen,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppTheme.spotifyWhite,
                    size: 32,
                  ),
                  onPressed: () {
                    if (audioProvider.isPlaying) {
                      audioProvider.pause();
                    } else {
                      audioProvider.play();
                    }
                  },
                ),
              ),
              // Next
              IconButton(
                icon: const Icon(
                  Icons.skip_next,
                  color: AppTheme.spotifyWhite,
                  size: 32,
                ),
                onPressed: () {
                  audioProvider.next();
                },
              ),
              // Repeat
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: audioProvider.isRepeated 
                      ? AppTheme.spotifyGreen 
                      : AppTheme.spotifyWhite,
                  size: 28,
                ),
                onPressed: () {
                  audioProvider.toggleRepeat();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(
              Icons.cast,
              color: AppTheme.spotifyWhite,
            ),
            onPressed: () {
              // TODO: Cast functionality
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.queue_music,
              color: AppTheme.spotifyWhite,
            ),
            onPressed: () {
              // TODO: Show queue
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.share,
              color: AppTheme.spotifyWhite,
            ),
            onPressed: () {
              // TODO: Share functionality
            },
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
