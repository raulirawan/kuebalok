import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/models/user_model.dart';

class CartModel {
  int? id;
  FoodModel? food;
  int? userId;
  int? quantity;

  CartModel({
    this.id,
    this.food,
    this.userId,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    food = FoodModel.fromJson(json['food']);
    userId = json['userId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food': food!.toJson(),
      'userId': userId,
      'quantity': quantity,
    };
  }

  int getTotalPrice() {
    var totalPrice = food!.price! * quantity!;
    return totalPrice;
  }
}
