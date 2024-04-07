class ToppingModel {
  int? id;
  String? name;
  double? price;

  ToppingModel({this.id, this.name, this.price});

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
