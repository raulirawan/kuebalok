import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/models/transaction_model.dart';

class TransactionService {
  String baseUrl = 'https://kuebalokbatavia.my.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, int totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'items': carts
            .map(
              (cart) => {
                'id': cart.food!.id,
                'qty': cart.quantity,
                'price': cart.food!.price,
              },
            )
            .toList(),
        'total_price': totalPrice,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Checkout!");
    }
  }

  Future<List<TransactionModel>> getTransactions(String token) async {
    var url = '$baseUrl/transactions';
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": token,
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    print("status code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      List<TransactionModel> transactions = [];

      for (var item in data) {
        transactions.add(TransactionModel.fromJson(item));
      }

      return transactions;
    } else {
      throw Exception('Gagal Get Transaction!');
    }
  }

  Future<List<TransactionModel>> getTransactionOnProgress(String token) async {
    var url = '$baseUrl/transactions/on/progress';
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    print("status code " + response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data'];
      List<TransactionModel> transactions = [];

      for (var item in data) {
        transactions.add(TransactionModel.fromJson(item));
      }

      return transactions;
    } else {
      throw Exception('Gagal Get Transaction!');
    }
  }

  // update transaksi
  Future<bool> updateTransaction({
    int? transactionId,
    String? token,
  }) async {
    var url = '$baseUrl/transactions/on/progress/${transactionId!}';
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": token.toString(),
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Update Transaksi');
    }
  }
}
