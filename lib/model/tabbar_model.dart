class TabBarModel {
  final String title;
  final String location;
  final String image;
  final int price;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.price});
}

List<TabBarModel> places = [
  TabBarModel(
      title: "Rara Lake",
      location: "Mugu",
      image: "assets/images/rara.jpg",
      price: 320),
  TabBarModel(
      title: "Tilicho Lake",
      location: "Manang",
      image: "assets/images/tilicho.jpg",
      price: 262),
  TabBarModel(
      title: "Pokhara",
      location: "Kaski",
      image: "assets/images/pokhara.jpg",
      price: 221)
];
List<TabBarModel> inspiration = [
  TabBarModel(
      title: "Mustang",
      location: "Mustang",
      image: "assets/images/mustang.jpg",
      price: 430),
  TabBarModel(
      title: "Gosaikunda",
      location: "Rasuwa",
      image: "assets/images/gosaikunda.jpg",
      price: 233),
  TabBarModel(
      title: "Everest Base Camp",
      location: "Solukhumbu",
      image: "assets/images/Everest-Base-Camp.jpg",
      price: 550),
];
List<TabBarModel> popular = [
  TabBarModel(
      title: "Lumbini",
      location: "Rupandehi",
      image: "assets/images/lumbini.jpg",
      price: 756),
  TabBarModel(
      title: "Bandipur",
      location: "Tanahun",
      image: "assets/images/bandipur.jpg",
      price: 321),
  TabBarModel(
      title: "Lukla",
      location: "Solukhumbu",
      image: "assets/images/lukla.jpg",
      price: 340),
];
