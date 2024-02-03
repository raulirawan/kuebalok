import 'package:flutter/material.dart';
import 'package:kuebalok/models/user_model.dart';
import 'package:kuebalok/services/auth_services.dart';
import 'package:kuebalok/services/user_services.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? email,
    String? password,
    int? phoneNumber,
    String? address,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber.toString(),
        address: address,
      );
      _user = user;
      print("Halo");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      print("Halo");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout(
    String token,
  ) async {
    try {
      await AuthService().logout(token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProfile({
    String? name,
    int? phoneNumber,
    String? address,
    String? token,
  }) async {
    try {
      await AuthService().updateProfile(
        name: name,
        phoneNumber: phoneNumber.toString(),
        address: address,
        token: token.toString(),
      );

      _user.name = name;
      _user.phoneNumber = phoneNumber;
      _user.address = address;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
