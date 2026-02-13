import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "http://10.0.2.2:5000";

  static Future<String?> googleLogin(String name, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/google-login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["role"];
    }

    return null;
  }

  static Future<bool> createOrder(Map<String, dynamic> order) async {
    final response = await http.post(
      Uri.parse("$baseUrl/orders"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(order),
    );

    return response.statusCode == 201;
  }
}
