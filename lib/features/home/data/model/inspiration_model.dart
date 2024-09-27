// class InspirationModel {
//   int? count;
//   dynamic next;
//   dynamic previous;
//   List<Result>? results;

//   InspirationModel({
//     this.count,
//     this.next,
//     this.previous,
//     this.results,
//   });

//   factory InspirationModel.fromJson(Map<String, dynamic> json) =>
//       InspirationModel(
//         count: json["count"],
//         next: json["next"],
//         previous: json["previous"],
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );
// }

// class Result {
//   int? id;
//   String? name;
//   String? description;
//   String? location;
//   String? latitude;
//   String? longitude;
//   String? averageRating;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<String>? images;

//   Result({
//     this.id,
//     this.name,
//     this.description,
//     this.location,
//     this.latitude,
//     this.longitude,
//     this.averageRating,
//     this.createdAt,
//     this.updatedAt,
//     this.images,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         location: json["location"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         averageRating: json["average_rating"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         images: List<String>.from(json["images"].map((x) => x)),
//       );
// }

import 'package:travel_app_flutter/features/home/domain/entities/inspiration.dart';

class InspirationModel extends Inspiration {
  InspirationModel({
    required super.count,
    super.next,
    super.previous,
    required super.results,
  });

  factory InspirationModel.fromJson(Map<String, dynamic> json) =>
      InspirationModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
      );
}

class ResultModel extends Result {
  ResultModel({
    required super.id,
    super.name,
    super.description,
    super.location,
    super.latitude,
    super.longitude,
    super.averageRating,
    super.createdAt,
    super.updatedAt,
    super.images,
  });

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
