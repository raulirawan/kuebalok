import 'package:kuebalok/models/food_model.dart';
import 'package:kuebalok/models/user_model.dart';

class TransactionModel {
  int? id;
  int? userId;
  UserModel? user;
  String? invoice;
  String? status;
  int? totalPrice;

  TransactionModel({
    this.id,
    this.userId,
    this.user,
    this.invoice,
    this.status,
    this.totalPrice,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    user = UserModel.fromJson(json['user']);
    invoice = json['invoice'];
    status = json['status'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user!.toJson(),
      'user_id': userId,
      'invoice': invoice,
      'status': status,
      'total_price': totalPrice,
    };
  }
}
