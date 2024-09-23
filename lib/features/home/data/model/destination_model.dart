class DestinationModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  DestinationModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  int? id;
  String? name;
  String? description;
  String? location;
  String? latitude;
  String? longitude;
  String? averageRating;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Image>? images;

  Result({
    this.id,
    this.name,
    this.description,
    this.location,
    this.latitude,
    this.longitude,
    this.averageRating,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        averageRating: json["average_rating"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );
}

class Image {
  int? id;
  String? image;
  DateTime? uploadedAt;

  Image({
    this.id,
    this.image,
    this.uploadedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        uploadedAt: DateTime.parse(json["uploaded_at"]),
      );
}
