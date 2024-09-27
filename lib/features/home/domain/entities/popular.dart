class Popular {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  Popular({
    required this.count,
    required this.next,
    required this.previous,
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
