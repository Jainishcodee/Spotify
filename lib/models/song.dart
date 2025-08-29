class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final Duration duration;
  final String? imageUrl;
  final String? audioUrl;
  final bool isLiked;
  final int playCount;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    this.imageUrl,
    this.audioUrl,
    this.isLiked = false,
    this.playCount = 0,
  });

  Song copyWith({
    String? id,
    String? title,
    String? artist,
    String? album,
    Duration? duration,
    String? imageUrl,
    String? audioUrl,
    bool? isLiked,
    int? playCount,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      isLiked: isLiked ?? this.isLiked,
      playCount: playCount ?? this.playCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'duration': duration.inSeconds,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'isLiked': isLiked,
      'playCount': playCount,
    };
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      duration: Duration(seconds: json['duration']),
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      isLiked: json['isLiked'] ?? false,
      playCount: json['playCount'] ?? 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Song && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artist, album: $album)';
  }
}
