import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../providers/playlist_provider.dart';
import '../providers/user_provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/good_evening_grid.dart';
import '../widgets/recently_played_list.dart';
import '../widgets/jump_back_in_list.dart';
import '../utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  context.watch<UserProvider>().getGreeting(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.history),
                  onPressed: () {
                    // TODO: Navigate to history
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {
                    // TODO: Navigate to notifications
                  },
                ),
              ],
            ),
          ),
          
          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Good Evening Section
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Evening',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GoodEveningGrid(artists: playlistProvider.goodEveningArtists),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                ),

                // Recently Played Section
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recently Played',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        RecentlyPlayedList(playlists: playlistProvider.recentlyPlayed),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                ),

                // Jump Back In Section
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jump Back In',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        JumpBackInList(playlists: playlistProvider.jumpBackIn),
                        const SizedBox(height: 32),
                      ],
                    );
                  },
                ),

                // Trending Songs Section
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending Songs',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: playlistProvider.trendingSongs.length,
                            itemBuilder: (context, index) {
                              final song = playlistProvider.trendingSongs[index];
                              return Container(
                                width: 160,
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Album Art
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        width: 160,
                                        height: 160,
                                        decoration: BoxDecoration(
                                          color: AppTheme.spotifyMediumGray,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
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
                                                      size: 48,
                                                    ),
                                                  );
                                                },
                                              )
                                            : Container(
                                                color: AppTheme.spotifyMediumGray,
                                                child: const Icon(
                                                  Icons.music_note,
                                                  color: AppTheme.spotifyWhite,
                                                  size: 48,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Song Title
                                    Text(
                                      song.title,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Artist Name
                                    Text(
                                      song.artist,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppTheme.spotifyLightGray,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
