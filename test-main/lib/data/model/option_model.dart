class OptionModel {
  int? id;
  String? name;
  double? price;

  OptionModel({this.id, this.name, this.price});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
