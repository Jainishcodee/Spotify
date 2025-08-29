import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/playlist_provider.dart';
import '../widgets/library_list.dart';
import '../utils/theme.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppTheme.spotifyGreen,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: AppTheme.spotifyWhite,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Your Library',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // TODO: Navigate to search
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // TODO: Add new playlist
                  },
                ),
              ],
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Playlists'),
                Tab(text: 'Artists'),
              ],
              indicatorColor: AppTheme.spotifyGreen,
              labelColor: AppTheme.spotifyWhite,
              unselectedLabelColor: AppTheme.spotifyLightGray,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          
          // Content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Playlists Tab
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return LibraryList(
                      items: playlistProvider.userPlaylists,
                      type: LibraryItemType.playlist,
                    );
                  },
                ),
                // Artists Tab
                Consumer<PlaylistProvider>(
                  builder: (context, playlistProvider, child) {
                    return LibraryList(
                      items: playlistProvider.followedArtists,
                      type: LibraryItemType.artist,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum LibraryItemType { playlist, artist }
