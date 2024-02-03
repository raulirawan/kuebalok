import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kuebalok/models/food_model.dart';

class FoodServices {
  String baseUrl = 'https://kuebalokbatavia.my.id/api';

  Future<List<FoodModel>> getFood() async {
    var url = '$baseUrl/food';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    print("status code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      List<FoodModel> foods = [];

      for (var item in data) {
        foods.add(FoodModel.fromJson(item));
      }

      return foods;
    } else {
      throw Exception('Gagal Get Product!');
    }
  }
}
