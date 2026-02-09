import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  /// Backend ishlayaptimi – test
  static Future<String> testBackend() async {
    final res = await http.get(Uri.parse('$baseUrl/test'));

    if (res.statusCode == 200) {
      return jsonDecode(res.body)['message'];
    } else {
      throw Exception('Backend ulanmadı');
    }
  }
}
