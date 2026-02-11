import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:5000";

  Future<List<dynamic>> getOrders() async {
    final response = await http.get(Uri.parse("$baseUrl/orders"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load orders");
    }
  }

  Future<void> addOrder(String name) async {
    final response = await http.post(
      Uri.parse("$baseUrl/orders"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name}),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add order");
    }
  }
}
