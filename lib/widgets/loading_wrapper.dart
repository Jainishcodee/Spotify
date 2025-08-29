import 'package:flutter/material.dart';
import 'loading_animation.dart';

class LoadingWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? loadingText;
  final double loadingSize;

  const LoadingWrapper({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingText,
    this.loadingSize = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingAnimation(
        size: loadingSize,
        text: loadingText,
      );
    }
    return child;
  }
}

// Example usage in a screen with loading state
class ExampleLoadingScreen extends StatefulWidget {
  const ExampleLoadingScreen({super.key});

  @override
  State<ExampleLoadingScreen> createState() => _ExampleLoadingScreenState();
}

class _ExampleLoadingScreenState extends State<ExampleLoadingScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading data
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Example'),
      ),
      body: LoadingWrapper(
        isLoading: _isLoading,
        loadingText: 'Loading your playlists...',
        loadingSize: 120.0,
        child: const Center(
          child: Text('Content loaded successfully!'),
        ),
      ),
    );
  }
}
