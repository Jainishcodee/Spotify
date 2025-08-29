import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/playlist.dart';
import '../models/artist.dart';
import '../utils/theme.dart';

class LibraryList extends StatelessWidget {
  final List<dynamic> items;
  final LibraryItemType type;

  const LibraryList({
    super.key,
    required this.items,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == LibraryItemType.playlist
                  ? Icons.playlist_play
                  : Icons.person,
              size: 64,
              color: AppTheme.spotifyMediumGray,
            ),
            const SizedBox(height: 16),
            Text(
              type == LibraryItemType.playlist
                  ? 'No playlists yet'
                  : 'No followed artists yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.spotifyMediumGray,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              type == LibraryItemType.playlist
                  ? 'Create your first playlist to get started'
                  : 'Follow your favorite artists to see them here',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.spotifyLightGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        
        if (type == LibraryItemType.playlist && item is Playlist) {
          return _buildPlaylistItem(context, item);
        } else if (type == LibraryItemType.artist && item is Artist) {
          return _buildArtistItem(context, item);
        }
        
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildPlaylistItem(BuildContext context, Playlist playlist) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppTheme.spotifyMediumGray,
            borderRadius: BorderRadius.circular(4),
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
                        size: 24,
                      ),
                    );
                  },
                )
              : Container(
                  color: AppTheme.spotifyMediumGray,
                  child: const Icon(
                    Icons.playlist_play,
                    color: AppTheme.spotifyWhite,
                    size: 24,
                  ),
                ),
        ),
      ),
      title: Text(
        playlist.name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        playlist.description ?? '${playlist.songCount} songs',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppTheme.spotifyLightGray,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          // TODO: Show playlist options
        },
      ),
      onTap: () {
        // TODO: Navigate to playlist
      },
    );
  }

  Widget _buildArtistItem(BuildContext context, Artist artist) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppTheme.spotifyMediumGray,
        backgroundImage: artist.imageUrl != null
            ? AssetImage(artist.imageUrl!)
            : null,
        child: artist.imageUrl == null
            ? const Icon(
                Icons.person,
                color: AppTheme.spotifyWhite,
                size: 28,
              )
            : null,
      ),
      title: Text(
        artist.name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${(artist.monthlyListeners / 1000000).toStringAsFixed(1)}M monthly listeners',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppTheme.spotifyLightGray,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          // TODO: Show artist options
        },
      ),
      onTap: () {
        // TODO: Navigate to artist
      },
    );
  }
}
