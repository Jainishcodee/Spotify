import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/playlist.dart';
import '../utils/theme.dart';

class RecentlyPlayedList extends StatelessWidget {
  final List<Playlist> playlists;

  const RecentlyPlayedList({
    super.key,
    required this.playlists,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Playlist Cover
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to playlist
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: AppTheme.spotifyMediumGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: playlist.imageUrl != null
                          ? Image.asset(
                              playlist.imageUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppTheme.spotifyMediumGray,
                                  child: const Icon(
                                    Icons.playlist_play,
                                    color: AppTheme.spotifyWhite,
                                    size: 48,
                                  ),
                                );
                              },
                            )
                          : Container(
                              color: AppTheme.spotifyMediumGray,
                              child: const Icon(
                                Icons.playlist_play,
                                color: AppTheme.spotifyWhite,
                                size: 48,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Playlist Name
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // Playlist Description
                Text(
                  playlist.description ?? '',
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
    );
  }
}
