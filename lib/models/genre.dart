import 'package:flutter/material.dart';

class Genre {
  final String id;
  final String name;
  final Color color;
  final String? imageUrl;

  Genre({
    required this.id,
    required this.name,
    required this.color,
    this.imageUrl,
  });

  Genre copyWith({
    String? id,
    String? name,
    Color? color,
    String? imageUrl,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color.value,
      'imageUrl': imageUrl,
    };
  }

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
      color: Color(json['color']),
      imageUrl: json['imageUrl'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Genre && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }
}
