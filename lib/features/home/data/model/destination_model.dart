// class DestinationModel {
//   int? count;
//   dynamic next;
//   dynamic previous;
//   List<Result>? results;

//   DestinationModel({
//     this.count,
//     this.next,
//     this.previous,
//     this.results,
//   });

//   factory DestinationModel.fromJson(Map<String, dynamic> json) =>
//       DestinationModel(
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

import 'package:travel_app_flutter/features/home/domain/entities/destinatin.dart';

class DestinationModel extends Destination {
  DestinationModel(
      {required super.count,
      super.next,
      super.previous,
      required super.results});

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: List<Result>.from(
          json["results"].map((x) => ResultModel.fromJson(x))),
    );
  }
}

class ResultModel extends Result {
  ResultModel({
    required super.id,
    required super.name,
    required super.description,
    required super.location,
    required super.latitude,
    required super.longitude,
    required super.averageRating,
    required super.createdAt,
    required super.updatedAt,
    required super.images,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
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
}
