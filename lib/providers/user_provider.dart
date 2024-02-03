// import 'package:flutter/material.dart';
// import 'package:kuebalok/models/user_model.dart';
// import 'package:kuebalok/services/auth_services.dart';
// import 'package:kuebalok/services/user_services.dart';

// class AuthProvider with ChangeNotifier {
//   late UserModel _user;

//   UserModel get user => _user;

//   set user(UserModel user) {
//     _user = user;
//     notifyListeners();
//   }

//   Future<bool> getUser({
//     String? name,
//     String? email,
//     String? password,
//     int? phoneNumber,
//     String? address,
//   }) async {
//     try {
//       UserModel user = await UserService().getUser(
//         name,
//         email,
//         phoneNumber.toString(),
//         address,
//       );
//       _user = user;
//       print("Halo");
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
