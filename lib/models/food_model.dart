class FoodModel {
  int? id;
  String? name;
  String? photo;
  int? price;
  String? kategori;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  FoodModel({
    this.id,
    this.name,
    this.photo,
    this.price,
    this.kategori,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    price = int.parse(json['price'].toString());
    kategori = json['kategori'];
    description = json['description'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'price': price,
      'kategori': kategori,
      'description': description,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
