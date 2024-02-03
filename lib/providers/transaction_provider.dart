import 'package:flutter/material.dart';
import 'package:kuebalok/models/cart_model.dart';
import 'package:kuebalok/models/transaction_model.dart';
import 'package:kuebalok/services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, int totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<void> getransactions(String token) async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getTransactions(token);
      _transactions = transactions;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getTransactionOnProgress(String token) async {
    try {
      List<TransactionModel> transactionsOnProgress =
          await TransactionService().getTransactionOnProgress(token);
      _transactions = transactionsOnProgress;
    } catch (e) {
      print(e);
    }
  }

  // update transaction
  Future<bool> updateTransaction({
    int? transactionId,
    String? token,
    String? status,
  }) async {
    try {
      await TransactionService().updateTransaction(
        transactionId: transactionId,
        token: token.toString(),
      );

      var data =
          _transactions.where((element) => element.id == transactionId).first;

      data.status = status;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
