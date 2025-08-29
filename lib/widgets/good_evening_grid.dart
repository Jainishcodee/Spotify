import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/artist.dart';
import '../utils/theme.dart';

class GoodEveningGrid extends StatelessWidget {
  final List<Artist> artists;

  const GoodEveningGrid({
    super.key,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        final artist = artists[index];
        return GestureDetector(
          onTap: () {
            // TODO: Navigate to artist page
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.spotifyDarkGray,
            ),
            child: Stack(
              children: [
                // Artist Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: artist.imageUrl != null
                      ? Image.asset(
                          artist.imageUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppTheme.spotifyMediumGray,
                              child: const Icon(
                                Icons.person,
                                color: AppTheme.spotifyWhite,
                                size: 48,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: AppTheme.spotifyMediumGray,
                          child: const Icon(
                            Icons.person,
                            color: AppTheme.spotifyWhite,
                            size: 48,
                          ),
                        ),
                ),
                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                // Artist Name
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Text(
                    artist.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.spotifyWhite,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
