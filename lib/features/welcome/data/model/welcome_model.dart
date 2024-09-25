class WelcomeModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  WelcomeModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory WelcomeModel.fromJson(Map<String, dynamic> json) => WelcomeModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  int? id;
  String? title;
  String? subtitle;
  String? description;
  String? image;

  Result({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        image: json["image"],
      );
}
