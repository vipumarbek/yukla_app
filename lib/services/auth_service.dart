import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';
import '../models/user.dart';

class AuthService {
  static Future<User?> login(String email, String password) async {
    final res = await http.post(
      Uri.parse("${Constants.baseUrl}/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    }
    return null;
  }

  static Future<bool> register(String email, String password) async {
    final res = await http.post(
      Uri.parse("${Constants.baseUrl}/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password"}),
    );
    return res.statusCode == 200;
  }
}
