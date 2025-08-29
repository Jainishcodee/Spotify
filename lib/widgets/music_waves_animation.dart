import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MusicWavesAnimation extends StatelessWidget {
  final double width;
  final double height;
  final bool isPlaying;

  const MusicWavesAnimation({
    super.key,
    this.width = 100.0,
    this.height = 50.0,
    this.isPlaying = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isPlaying
          ? Lottie.asset(
              'assets/animations/music_waves.json',
              width: width,
              height: height,
              fit: BoxFit.contain,
              repeat: true,
            )
          : Container(
              width: width,
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return Container(
                    width: 4,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              ),
            ),
    );
  }
}

// Example usage in player screen
class AudioVisualizationExample extends StatelessWidget {
  final bool isPlaying;

  const AudioVisualizationExample({
    super.key,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Audio Visualization',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          MusicWavesAnimation(
            width: 120.0,
            height: 60.0,
            isPlaying: isPlaying,
          ),
          const SizedBox(height: 16),
          Text(
            isPlaying ? 'Now Playing' : 'Paused',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
