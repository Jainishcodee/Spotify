class Playlist {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final int songCount;
  final bool isLiked;

  Playlist({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.songCount = 0,
    this.isLiked = false,
  });

  Playlist copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? songCount,
    bool? isLiked,
  }) {
    return Playlist(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      songCount: songCount ?? this.songCount,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'songCount': songCount,
      'isLiked': isLiked,
    };
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      songCount: json['songCount'] ?? 0,
      isLiked: json['isLiked'] ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Playlist && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Playlist(id: $id, name: $name, songCount: $songCount)';
  }
}
