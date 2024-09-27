import 'package:travel_app_flutter/features/home/domain/entities/popular.dart';

class PopularModel extends Popular {
  PopularModel(
      {required super.count,
      required super.results,
      required super.next,
      required super.previous});

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
        count: json["count"],
        results: List<Result>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        next: json["next"],
        previous: json["previous"],
      );
}

class ResultModel extends Result {
  ResultModel(
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

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
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
