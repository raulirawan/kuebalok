import 'package:flutter/material.dart';
import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/services/food_services.dart';

class FoodProvider with ChangeNotifier {
  List<FoodModel> _foods = [];

  List<FoodModel> get foods => _foods;

  set foods(List<FoodModel> foods) {
    _foods = foods;
    notifyListeners();
  }

  Future<void> getFoods() async {
    try {
      List<FoodModel> foods = await FoodServices().getFood();
      _foods = foods;
    } catch (e) {
      print(e);
    }
  }
}
