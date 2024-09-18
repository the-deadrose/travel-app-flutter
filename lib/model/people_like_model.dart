class PeopleAlsoLikeModel {
  final String title;
  final String location;
  final int day;
  final String image;
  final int price;

  PeopleAlsoLikeModel(
      {required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.price});
}

List<PeopleAlsoLikeModel> peopleAlsoLikeModel = [
  PeopleAlsoLikeModel(
      title: "Chitlang",
      location: "Makwanpur",
      image: "assets/images/chitlang.jpg",
      day: 5,
      price: 430),
  PeopleAlsoLikeModel(
      title: "Nagarkot",
      location: "Bhaktapur",
      image: "assets/images/nagarkot.jpg",
      day: 7,
      price: 233),
  PeopleAlsoLikeModel(
      title: "Bhaktapur",
      location: "Bhaktapur",
      image: "assets/images/bhaktapur.jpg",
      day: 9,
      price: 550),
  PeopleAlsoLikeModel(
      title: "Dhulikhel",
      location: "Kavrepalanchok",
      image: "assets/images/dhulikhel.jpg",
      day: 3,
      price: 546),
];
