class UserModel {
  int? id;
  String? name;
  String? email;
  int? phoneNumber;
  String? address;
  String? roles;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.roles,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: int.parse(json['phoneNumber'].toString()),
        address: json['address'],
        roles: json['roles'],
        token: json['token'],
      );

  factory UserModel.fromJsonn(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: int.parse(json['phoneNumber'].toString()),
        address: json['address'],
        roles: json['roles'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'token': token,
    };
  }
}
