class Destination {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  Destination({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });
}

class Result {
  int id;
  String name;
  String description;
  String location;
  String latitude;
  String longitude;
  String averageRating;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> images;

  Result({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.averageRating,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });
}
