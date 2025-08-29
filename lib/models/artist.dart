class Artist {
  final String id;
  final String name;
  final String? imageUrl;
  final int monthlyListeners;
  final bool isFollowed;

  Artist({
    required this.id,
    required this.name,
    this.imageUrl,
    this.monthlyListeners = 0,
    this.isFollowed = false,
  });

  Artist copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? monthlyListeners,
    bool? isFollowed,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      monthlyListeners: monthlyListeners ?? this.monthlyListeners,
      isFollowed: isFollowed ?? this.isFollowed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'monthlyListeners': monthlyListeners,
      'isFollowed': isFollowed,
    };
  }

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      monthlyListeners: json['monthlyListeners'] ?? 0,
      isFollowed: json['isFollowed'] ?? false,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Artist && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Artist(id: $id, name: $name)';
  }
}
