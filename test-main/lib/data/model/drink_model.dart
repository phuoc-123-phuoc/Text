class DrinkModel {
  int id;
  String name;
  String img;
  String description;
  double price;
  double salePrice;
  double favorite;
  double rating;

  DrinkModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.description,
      required this.price,
      required this.salePrice,
      required this.favorite,
      required this.rating});

  final List<DrinkModel> drinks = [
    DrinkModel(
        id: 1,
        name: "Trà Đào mix Dâu",
        img: "assets/images/product.jpg",
        description:
            "Thành phần: Cà phê nguyên chất, sữa, bột béo, đường, hương liệu, ...",
        price: 59000.0,
        salePrice: 45000.0,
        favorite: 0.0,
        rating: 4.5),
  ];
}
