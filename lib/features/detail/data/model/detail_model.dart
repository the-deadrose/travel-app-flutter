import 'package:travel_app_flutter/features/detail/domain/entities/detail.dart';

class DetailModel extends Detail {
  DetailModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.location,
      required super.latitude,
      required super.longitude,
      required super.averageRating,
      required super.createdAt,
      required super.updatedAt,
      required super.images});

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        averageRating: json["average_rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
