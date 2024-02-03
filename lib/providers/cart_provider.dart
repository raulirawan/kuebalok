import 'package:flutter/material.dart';
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/models/food_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(FoodModel food, int userId) {
    if (foodExist(food, userId)) {
      int index = _carts.indexWhere(
        (element) => element.food!.id == food.id && element.userId == userId,
      );
      _carts[index].userId = userId;
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          food: food,
          quantity: 1,
          userId: userId,
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  removeAllCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! - 1;

    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;

    for (var item in _carts) {
      total += item.quantity!;
    }
    return total;
  }

  totalPrice(int userId) {
    int total = 0;

    for (var item in _carts.where((element) => element.userId == userId)) {
      total += item.quantity! * item.food!.price!;
    }
    return total;
  }

  foodExist(FoodModel food, int userId) {
    if (_carts.indexWhere((element) =>
            element.food!.id == food.id && element.userId == userId) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
