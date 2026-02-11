import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:3000";

  Future<List<dynamic>> getOrders() async {
    final response = await http.get(Uri.parse("$baseUrl/orders"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [];
    }
  }

  Future<void> addOrder(String name) async {
    await http.post(
      Uri.parse("$baseUrl/orders"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name}),
    );
  }
}
