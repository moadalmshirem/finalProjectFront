// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AuthService {
//   final String apiUrl = 'http://10.0.2.2:3000';

//   Future<void> registerUser(String username, String password) async {
//     print(username);
//     print(password);
//     print("asdasdasdasd");

//     final response = await http.post(
//       Uri.parse('$apiUrl/register'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'username': username,
//         'password': password,
//       }),
//     );
//     print(response);
//     print("asdasdasdasd");


//     if (response.statusCode == 201) {
//       print('User registered successfully');
//     } else {
//       throw Exception('Failed to register user');
//     }
//   }

//   Future<String> loginUser(String user, String password) async {
//     final response = await http.post(
//       Uri.parse('$apiUrl/login'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(<String, String>{
//         'username': user,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['token']; 
//     } else {
//       throw Exception('Failed to login');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
final String apiUrl = 'http://192.168.1.100:3000'; // Correct

  Future<void> registerUser(String username, String password) async {
    print('Registering user: $username');

    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print('User registered successfully');
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }
   
   Future<String> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token']; 
    } else {
      throw Exception('Failed to login');
    }
  }}

