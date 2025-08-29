import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../utils/theme.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

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
            title: Text(
              'Premium',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Premium Header
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.spotifyGreen,
                        AppTheme.spotifyGreen.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.diamond,
                        color: AppTheme.spotifyWhite,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Get Premium Free for 1 Month',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppTheme.spotifyWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Just \$9.99/month after. Cancel anytime.',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.spotifyWhite,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserProvider>().setPremium(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Premium activated!'),
                                backgroundColor: AppTheme.spotifyGreen,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.spotifyBlack,
                            foregroundColor: AppTheme.spotifyWhite,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'GET STARTED',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            // TODO: Show terms and conditions
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppTheme.spotifyWhite,
                            side: const BorderSide(color: AppTheme.spotifyWhite),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'VIEW PLANS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Features Section
                Text(
                  'Why go Premium?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                _buildFeatureItem(
                  context,
                  icon: Icons.download,
                  title: 'Download music.',
                  subtitle: 'Listen anywhere.',
                ),
                _buildFeatureItem(
                  context,
                  icon: Icons.music_note,
                  title: 'Ad-free music listening.',
                  subtitle: 'Enjoy uninterrupted music.',
                ),
                _buildFeatureItem(
                  context,
                  icon: Icons.shuffle,
                  title: 'Play any song.',
                  subtitle: 'Even on mobile.',
                ),
                _buildFeatureItem(
                  context,
                  icon: Icons.skip_next,
                  title: 'Unlimited skips.',
                  subtitle: 'Just hit next.',
                ),
                
                const SizedBox(height: 32),
                
                // Comparison Section
                Text(
                  'Free vs Premium',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                _buildComparisonTable(context),
                
                const SizedBox(height: 32),
                
                // Terms and Conditions
                Text(
                  'Terms and conditions apply. 1 month free not available for users who have already tried Premium.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.spotifyLightGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.spotifyGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppTheme.spotifyWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

  Widget _buildComparisonTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.spotifyDarkGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppTheme.spotifyGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Free',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.spotifyWhite,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Premium',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.spotifyWhite,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Features
          _buildComparisonRow('Music', '✓', '✓'),
          _buildComparisonRow('Shuffle play', '✓', '✓'),
          _buildComparisonRow('Ad-supported music', '✓', '✗'),
          _buildComparisonRow('Offline listening', '✗', '✓'),
          _buildComparisonRow('Play any track', '✗', '✓'),
          _buildComparisonRow('Unlimited skips', '✗', '✓'),
          _buildComparisonRow('High quality audio', '✗', '✓'),
        ],
      ),
    );
  }

  Widget _buildComparisonRow(String feature, String free, String premium) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppTheme.spotifyMediumGray,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              feature,
              style: const TextStyle(
                color: AppTheme.spotifyWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              free,
              style: TextStyle(
                color: free == '✓' ? AppTheme.spotifyGreen : AppTheme.spotifyLightGray,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              premium,
              style: TextStyle(
                color: premium == '✓' ? AppTheme.spotifyGreen : AppTheme.spotifyLightGray,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
