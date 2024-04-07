class SizeModel {
  int? id;
  String? name;
  double? price;

  SizeModel({this.id, this.name, this.price});

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
