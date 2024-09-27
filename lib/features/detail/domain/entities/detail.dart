class Detail {
  int id;
  String name;
  String description;
  String location;
  String latitude;
  String longitude;
  double averageRating;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> images;

  Detail({
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
