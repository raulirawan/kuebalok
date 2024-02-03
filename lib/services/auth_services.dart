import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kuebalok/models/user_model.dart';

class AuthService {
  String baseUrl = 'https://kuebalokbatavia.my.id/api';

  Future<UserModel> register({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? address,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  logout(String token) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": token,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['meta']['message'];

      return message;
    } else {
      throw Exception('Gagal Logout');
    }
  }

  Future<bool> updateProfile({
    String? name,
    String? phoneNumber,
    String? address,
    String? token,
  }) async {
    var url = '$baseUrl/user/update';
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": token.toString(),
    };
    var body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Update Profile');
    }
  }
}
