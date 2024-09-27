class Inspiration {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  Inspiration({
    this.count,
    this.next,
    this.previous,
    this.results,
  });
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
  List<String>? images;

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
}
