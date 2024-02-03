// import 'package:http/http.dart' as http;
// import 'package:kuebalok/models/user_model.dart';

// class UserService {
//   String baseUrl = 'https://kuebalokbatavia.my.id/api';

//   Future<UserModel> getUser(String token) async {
//     var url = '$baseUrl/user';
//     var headers = {
//       'Content-Type': 'application/json',
//       "Authorization": token,
//     };

//     var response = await http.get(Uri.parse(url), headers: headers);

//     print(response.body);
//     print("Status Code" + response.statusCode.toString());

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Exception('Gagal Get User');
//     }
//   }
// }
